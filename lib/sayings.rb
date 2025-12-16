module Sayings

  def Sayings.get_saying(type)
    happy = [
      "More ramen to you!",
      "I'm pleased.",
      "I see great potential.",
      "Thou shalt pass.",
      "Good, good!",
      "That was quite something.",
      "Most excellent.",
      "I'm proud of you.",
      "Your brothers are proud of you.",
      "Your sisters are proud of you.",
      "Like a feather, your code floats in the air.",
      "Pizza for you! With anchovies I presume?",
      "Sweet smell of working code.",
      "As you grow older, you will learn there are many ways to do the right thing.",
      "Miyagi have hope for you.",
      "Good! Now use head for something other than target.",
      "Man who catch fly with chopstick accomplish anything.",
      "Banzai!",
      "Do you want to learn kung fu?",
      "I vowed to train you, and you have been trained. You are free to eat.",
      "There are no accidents.",
      "What goes on inside your head I do not always understand. But what goes on in your heart will never let us down.",
      "Beautiful. Elegant. Perfect. You made me proud.",
      "The Force will be with you, always."
    ]
              
    sad = [
       "Do I hear a spec failing?",
       "The path to enlightenment is a little long.",
       "You shall not pass!",
       "This isn't the code I was looking for.",
       "Hmm, a valiant attempt. But you must try again!",
       "Not quite there yet.",
       "No pizza for you. Not yet.",
       "Never give up. Ever!",
       "Your code did not fail, you just found another method that will not solve this problem.",
       "Ten flips, now!",
       "If no mistake have you made, yet losing you are ... a different game you should play.",
       "No! Try not. Do, or do not. There is no try.",
       "No such thing as bad student, only bad teacher. Teacher say, student do.",
       "You too much TV.",
       "First learn stand, then learn fly. Nature rule, Daniel-san, not mine.",
       "Wax on... wax off. Wax on... wax off.",
       "Breathe in, breathe out. And no scare fish.",
       "Hai! Hurt old man feeling.",
       "Oh, Daniel-san! You all wet behind ear!",
       "Learn how punch, after you learn how keep dry!",
       "Look at this tree, Shifu: I cannot make it blossom when it suits me nor make it bear fruit before its time.",
       "There is now a level zero.",
       "There are no accidents.",
       "Remember the path!",
       "When the path you walk always leads back to yourself, you never get anywhere.",
       "To make a bad day worse spend it wishing for the impossible."
    ]

    saying = sad.sample
    if type == "happy"
      saying = happy.sample
    end
    saying
  end
end
