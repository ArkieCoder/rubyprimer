class String
  def format(color: 'white')
    require 'tempfile'
    require 'base64'

    # Terminal detection
    def kitty?
      ENV['TERM'] == 'xterm-kitty' || ENV['TERM_PROGRAM'] == 'Kitty'
    end

    def iterm2?
      ENV['TERM_PROGRAM'] == 'iTerm.app'
    end

    # Get terminal columns, similar to tput cols
    cols = `tput cols`.to_i
    em = (cols * 0.60).to_f

    commonmark_content = <<~CMARK
    ---
    documentclass: standalone
    classoption: preview
    header-includes:
    - |
      ```{=latex}
      \\usepackage[width=#{em}em]{geometry}
      \\usepackage{xcolor}
      \\pagecolor{black}
      ```
    include-before:
    - |
      ```{=latex}
      \\color{#{color}}
      \\Large
      ```
    ...
    #{self}
    CMARK

    tmp_file = Tempfile.new(['stringformat', '.md'])
    tmp_file.write(commonmark_content)
    tmp_file.close

    pdf_file = tmp_file.path.sub('.md', '.pdf')

    # Run pandoc
    system("pandoc --pdf-engine=xelatex -V mainfont=\"IBM Plex Serif Light\" -f commonmark_x #{tmp_file.path} -o #{pdf_file} >/dev/null 2>&1")

    if File.exist?(pdf_file)
      if kitty?
        # Convert PDF to PNG for Kitty
        png_file = tmp_file.path.sub('.md', '.png')
        system("convert #{pdf_file} #{png_file} >/dev/null 2>&1")
        if File.exist?(png_file)
          png_data = File.read(png_file)
          base64_data = Base64.strict_encode64(png_data)
          # Clean up
          tmp_file.unlink
          File.unlink(pdf_file)
          File.unlink(png_file)
          # Return Kitty inline image sequence
          "\e_Gf=100,a=T,t=d;#{base64_data}\e\\"
        else
          # Fallback if PNG conversion fails
          tmp_file.unlink
          File.unlink(pdf_file)
          self
        end
      elsif iterm2?
        pdf_data = File.read(pdf_file)
        base64_data = Base64.strict_encode64(pdf_data)
        # Clean up
        tmp_file.unlink
        File.unlink(pdf_file)
        # Return iTerm2 inline image sequence
        "\e]1337;File=inline=1;preserveAspectRatio=1:#{base64_data}\a"
      else
        # Fallback for other terminals
        tmp_file.unlink
        File.unlink(pdf_file)
        self
      end
    else
      # Fallback if PDF generation fails
      tmp_file.unlink
      self
    end
  end
end
