class String
    def format()
        require 'tempfile'
        require 'base64'

        # Get terminal columns, similar to tput cols
        cols = `tput cols`.to_i
        em = (cols * 0.60).to_f

        commonmark_content = <<~CMARK
        ---
        fontcolor: white
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
          \\color{white}
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
            pdf_data = File.read(pdf_file)
            base64_data = Base64.strict_encode64(pdf_data)
            # Clean up
            tmp_file.unlink
            File.unlink(pdf_file)
            # Return iTerm2 inline image sequence
            "\e]1337;File=inline=1;preserveAspectRatio=1:#{base64_data}\a"
        else
            # Fallback if PDF generation fails
            self
        end
    end
end
