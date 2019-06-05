# MKS22X-FinalProject

Proposal Link: https://docs.google.com/document/d/1RerI4eAoXOlD_h9LP6QWaa-pHZHdHKrM2GXd6T4xs4s/edit

Prototype Link: https://docs.google.com/document/d/1i1rNw3WjzWzoSHw8UqQt8DXhQaxMBi8zXDU82bmqAoE/edit (Unedited)

UML Link: https://www.draw.io/#G1RLAxiiLrnN3N4yy_u8gt_xPWXEU1h1OJ

About:

This is a simple shoot-em-up game with 2 levels, each of which contains a boss. The game allows you to customize the controls. The controls include up,down,left,right movement, firing bullets,bombs and firing lasers when aquired.

When you open the game, you can chose to play the game by pressing P, go to options by pressing O and see the credits by pressing C. When options is chosen, the user is given the chance to view the default controls, and even chose custom controls. When players press P, they will be reminded of the controls before starting the game.

In each level, of which there is two, there are waves of enemies with varying characters such as movement and shooting method. After the end of the wave, the player will face a boss. There will be health dropped by the enemies occasionally and the user will die when the health bar reaches 0. 

When the player dies, he/she is given the chance to return to the main menu, or exit the game.

# Development Log:

## May 17th Friday-----------

Rafsan:

I created the file and added all the necessary classes from the UML

Added movements and display for the player (very basic and to be improved)

Added bullets and bombs and firing mechanism (again very basic straight moving bullets and bombs)

## May 18th Saturday----------

Kenson:

encoded controls in booleans, allowing for diagonal movement while shooting

added slow movement while holding down Shift, allowed variable speed/maxspeed in constructor

Rafsan:

Powerup (only health powerup for now) added, with simple verticle movements

Program organized into tabs and game over mode added when player touches the border (can be changed later)

## May 19th Sunday----------

Rafsan: Added countdown mechanism (basic and needs updating)

Kenson: started enemy class, reorganized constructors of living, wrote circle-circle collision detection to be used in many cases

## May 20th Monday ----------

Rafsan: Tried to implemented a multiplayer system using the same keyboard, the attempt was unsuccesful and will not be a feature of the final product

Kenson: made hitbox only visible in slow mode, started working on enemies shooting at regular time intervals

## May 21st Tuesday ----------

Rafsan: I started working on the countdown system at the start of the game. I also added a healthbar, but color change needs to be improved.

Kenson: enemies can now shoot at regular time intervals, multiple enemies can shoot at the same time, accounting for enemy velocity


## May 22nd Wednesday ----------

Kenson: 

offscreen enemies are deleted, enemies and bullets kill player on contact, player projectile kill enemies, and enemies can be spawned at certain times or when the screen is cleared

## May 23rd Thursday ------------

Rafsan: Wrote almost no code, but came up with many ideas for enemies and boss, and plans of implementing them. Likely we will implement about 4-5 of these. 

Kenson:
projectiles are now deleted when they come in contact with an enemy or go offscreen

## May 24th Friday -------------

Rafsan: Read about formatting syntax in github. Researched about smooth collisions (if we ever plan to use it).

## May 25th Saturday ------------

Rafsan: Created plan for level 2 enemies, and a Design for Level 2 boss. Read about user inputs in processsing.

## May 26th Sunday --------------

Rafsan: Created plan for level 3 enemies, and Design for Level 3 boss. Read through the code for testlevel1, planning to change some global variable names to reduce the number of merge conflicts

Kenson: created a ring of bullets which hover in place before dispersing, initial work on spatial partitioning

## May 27th Monday --------------

Rafsan: Stored the level plans as pdfs in the repository. Created an elliptical boss with triangular parts that fire bullets and release
when the health becomes low.

Kenson: created projectiles which enemies can aim at the player

## May 28th Tuesday -------------

Rafsan: Made a special type of Enemy that spins as it attacks, allowing its bullets to spread out. Next step is to add firing mechanism from testlevel1.

Kenson: Research into methods for spatial partitioning

## May 29th Wednesday ------------

Rafsan: Made use of controls from the demo, but adding other controls such as fire, slow speed, laser.

## May 30th Thursdsay -------------

Rafsan: I implemented a simple version of custom controls. Improved the user interaction system. Added pictures of arrows, to be user for arrow keys in the Option menu

## May 31st Friday ---------------

Rafsan: I completed a basic user controls system. I am yet to make the system customizable and incorperate it with the main code. Removed arrows from Custom Controls and replaced it with words (LEFT for left key instead of a left arrow shape) 

## June 1st Saturday -------------

Rafsan: Found some problems with user controls, researched on how to fix those problems.

## June 2nd Sunday --------------

Rafsan: I fixed problems with customizable user controls. I created an opening page with the game tittle, options and play. I transfered the code from Custom Controls to main file. Cleared any unnecessary code in the setup and draw section

## June 3rd Monday --------------

Rafsan: Added explosion system for opening screen animation and for laser firing. A target pointer system is also created to accompany that. Improved the UML diagram.

## June 4th Tuesday -----------

Rafsan: Completed Level 2. Created different types of enemies: zigzag, split and rotate. Attempted a Leaderboard system. Created a Boss, wrote the about page and the credit page. Fixed Bugs, and corrected the sizes and lengths. 
