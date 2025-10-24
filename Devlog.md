# ParadigmProject_One
Project description(from pdf)  <<
In this project you will create a prefix-notation expression calculator. The calculator will prompt
the user for an expression in prefix notation and calculate the result of the inputted expression.
A history will be kept so that previous results can be used in expressions. You are expected to
handle possible errors in the user’s input. Do not forget to follow the “Git/Project Instructions”.
>>
costs 
-Starting this project pretty late because i have alot of other classwork\   
-need to get used to github\ 
-On a time crunch due to the classwork\

\Notes 10/18/2025

Still gotta finish other projects but atleast im starting this now. I'm a little nervous about starting since I have to learn and then code with Haskell, though  
the scheme practice should help i think\

Notes 10/23/2025 session starting 11:30am\

-wow i was busy. I need to start working on it as soon as possible but im still at campus doing my classes. This session is meant to atleast get some starting point even if im in the middle of classes.\
-i found out that we are infact coding in racket from the class discord (thank goodness). The instructions mentioned haskell and i got confused.\
-i'll start making the project file right now.\
-again, im a little nervous starting this project as i am not experienced in this language.\
-laptop almost dying gotta save before next class\
- im not gonna lie i can't focus like this. I have atleast made somewhat of the framework in my head (like how i need a loop that repeats the process and some helper functions to help with processing and stuff. Still figuring out how to do the memory stuff.)\

Session ending at 1:29pm (im gonna start again later today with a more detailed log and actual project hopefully)\


Notes 10/23/2025 session starting 6:48pm\

-i'll attempt to actually complete the bulk work this time \
-im having a lot of trouble with the syntax\
-got divide to work but minus is still a problem\
-reading the instructions again i find out the reason for mode.rkt being provided (im stupid and dont read the instructions). Since i already made it myself with some research, i should compare the two parts anyway.\
-ok uh i tried opening the file and it closed my entire IDE. Luckily i saved beforehand i think\
-racket saves stuff for you if you click out thats actually awesome\
-errr from the looks of it the given mode looks awfully more simple than mine. Im gonna use some help to compare the two better.\
-to be consistent, i added the mode thing in and changed around a couple of stuff to make it fit. I tested the code and luckily no errors. Im gonna read the instructions to see if i missed anything again.\
-now that everything SEEMS to be in working order, I'll write down a summary to clear it up for myself. At the start is where the mode checks if its in batch mode or not. added an error prefix and prints differently for if its in batch mode or not (usually not?). Also made it so it can go back to the logs if prompted. (when i added the class mode thing into my code i think i messed something up. I'll go back to it tmrw) The next section allows the program to read the expressions given by the user. Determining what tokens are which was pretty easy if it was a value. For identifying i needed some help, its supposed to go over itself after it finds the next 2 values. The last part basically handles user input and then loops if the user doesnt say quit.\
-I'll add comments tmrw once i polish it, but for now i think im calling it for the night.\
 
 
Session ending(?) at 2:15am 10/24/2025 (next day)\

Session starting at 2:35 pm 10/24/2025\

-This session is dedicated to just polishing everything and added more detailed comments everywhere.\
-I also need to clean this markdown file up a bit. its quite messy right now and i need to get used to it\
-I'm also doing chores and other stuff so this session may be a little long than neccessary\
-When i had that previous history earlier, i suspected i had some weird memory issue thing since the history values were getting mixxed up. Now, it doesn't seem like its erroring when i test the history stuff now. Unfortunately i dont remember the last test cases i had when it occured from last night (it was a really long run so i can't pinpoint easily) so i can't exactly replicate it. It seems like it works now tho!\
-ok, comments are finished and now i'll organize this markdown file.\
-i'll probably have to commit several times for this to work\
-i dont know if its possible to do it easily but it would be great to put pictures in here to record test cases\

