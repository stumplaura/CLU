﻿# Blackwood Mansion Clue Game
#Taylor Metzger, Laura Stump, Scott Ressler, Frentzhermann Solidaire
#10/16/24
<#Welcome to a clue inspired game named CLU. Here you will enter a murder mystery world where you will be
tasked to investigate suspects to solve a murder.#>

function spl {
$splash = @"
                  ..';:cc::;,..        .x;;'''.;,                    .;;;;,            .''''''.
               'codlc;,,,,;:loxxc'     ,d;     xl .               .'kk.;;;.lk,        cx,....,o'
            .:ol,.           ..':xkl.  ,x;     xl .               .'ko.  ..lk,        cO.    'o'
          .cd:.        ...       .xoOl.,x;     xo..               .'Ok.  ..lO,        lO.    'd'
         .dc.     .,:oodddxdl;.xxx     ,x:     xo..               .'OO.  ..lo,        lO.    'd'
        .ol.     ,dl,......'ckOc       ,x:     ko..               .'OO.  ..lO,        l0.    ,d'
        :x...  .lo                     ,k: .   kd..               .'OO.  ..lO,        co.    ,x'
        dc.....ck'                     ,k: .  .kd..               .'OO.  ..lO,        co.    'x'
        d:.....lO                      ,kc .  .kd..               .'OO.  ..lO,        lO.    'x'
        co.    ,ko                     ,kc .  .ko..               .'Ok.  ..OO,        do.    'x,
         o,     .ox;........klOx       ,x: .  .kd..               .'ok.  ..0O,        oo.    'x,
         'o'.    .'colc::clddl'.xxx....'ko.....ko..........................oo.........oo;    'o'
           .lc.       ..............xOx'.cx:.....;dddddllllooooooooooooooooooOxoooooooO.     ;d;
            'cc'.              .'lkk;   ,ol'           .......................;Ox;O:      ,c;
              .;ll;'........':okxc.       ,lo;                                          ;c'
                 ..,;:ccllllc:'.             .'',,,,,,,,,;;;;;;;;;;;;;;.::::::::::::::ll.
"@

# Display the Splash Page
Write-Host $splash
}

function nar {
# Narrative Introduction
$narrative = @"
### The Murder at Blackwood Manor

In the opulent yet eerie Blackwood Manor, a lavish dinner party takes a sinister turn when the host, Mr. Blackwood, is found dead in the library. As the esteemed guests gather in shock, whispers of secrets and lies swirl around the estate. It's up to you to uncover the truth behind his untimely demise and the dark family secret that haunts this grand manor.

#### Characters:
- Miss Scarlet: A cunning socialite known for her charm and seduction.
- Professor Plum: A brilliant yet absent-minded scholar with a murky history.
- Mrs. White: The enigmatic housekeeper, whose loyalty conceals knowledge of the manor’s deepest secrets.
- Colonel Mustard: A retired military officer with a fiery temper and a shadowy past.
- Mrs. Peacock: A wealthy widow skilled in manipulation, she harbors secrets that could change everything.
- Mr. Green: A charming businessman whose smooth demeanor masks a web of deceit.

#### Clues:
- A torn note found in Mr. Blackwood's pocket mentions a hidden family fortune.
- A hidden journal in the safe behind a portrait details a scandal involving an illegitimate child.
- Footprints leading to the library suggest someone was trying to cover their tracks.
- A broken window indicates a struggle, hinting at an insider's betrayal.
- A wine glass with lipstick stains was discovered near the library entrance.

### Can you solve the murder? Who did it, where, and with what weapon?
"@

# Display the narrative
Write-Host $narrative
}

# Define suspects, rooms, and weapons
function def {
$global:suspects = @("Colonel Mustard", "Professor Plum", "Miss Scarlet", "Mrs. White", "Mr. Green", "Mrs. Peacock")
$global:rooms = @("Library", "Kitchen", "Ballroom", "Conservatory", "Dining Room", "Hall")
$global:weapons = @("Candlestick", "Poison", "Lead Pipe", "Revolver", "Rope", "Wrench")
}
# Generate the murder scenario
function mur {
$global:murderSuspect = "Mrs. Peacock"
$global:murderRoom = "Library"
$global:murderWeapon = "Poison"
}
# Game clues
function clu {
$global:clues = @{
    note = "A torn note found in Mr. Blackwood's pocket mentions a hidden family fortune." ;
    journal = "A hidden journal in the safe behind a portrait details a scandal involving an illegitimate child." ;
    footprints = "Footprints leading to the library suggest someone was trying to cover their tracks.";
    window = "A broken window indicates a struggle, hinting at an insider's betrayal.";
    glass = "A wine glass with lipstick stains was discovered near the library entrance."}
}
# Show clues to the player
#Write-Host ($clues.note)

# Randomize Clue Availability
#$availableClues = $clues | Get-Random -Count 3
#Write-Host "Available clues: $availableClues"

# Initialize attempts and game status
$attempts = 0
$gameOver = $false

# Game loop
function loo {
while (-not $gameOver) {
    Write ""
    Write "Actions:"
    Write "(1) - Accuse"
    Write "(2) - Interrogate"
    Write "(3) - Review"
    Write "(4) - Exit"
    Write-Host "What would you like to do?"
    $action = Read-Host

    switch ($action.ToLower()) {
        # Prompt user to make accusation
        1 {
            $attempts++
            Write "Suspects:"
            for ($i = 0; $i -lt 6; $i++){
                $listNum = [int]$i+1
                $susp = $suspects[$i]
                Write-Host "($listNum) - $susp"
            }
            $accusedSuspect = Read-Host "Who do you think the murderer is?"
            Write "Rooms:"
            for ($j = 0; $j -lt 6; $j++){
                $listNum = [int]$j+1
                $rm = $rooms[$j]
                Write-Host "($listNum) - $rm"
            }
            $accusedRoom = Read-Host "Where do you think the murder took place?"
            Write "Weapons:"
            for ($k = 0; $k -lt 6; $k++){
                $listNum = [int]$k+1
                $weap = $weapons[$k]
                Write-Host "($listNum) - $weap"
            }
            $accusedWeapon = Read-Host "What weapon do you think was used?"
            
            # Check the accusation
            if ($accusedSuspect -eq $murderSuspect -and $accusedRoom -eq $murderRoom -and $accusedWeapon -eq $murderWeapon) {
                Write-Host "`n`nCongratulations! You solved the mystery in $attempts attempts!"
                $gameOver = $true # Set game status to over
                end
            } else {
                Write-Host "Your accusation is incorrect. Try again!"
            }
        }
        # List all suspects to interrogation
        2 {
            Write "Suspects:"
            for ($m = 0; $m -lt 6; $m++){
                $listNum = [int]$m+1
                $susp = $suspects[$m]
                Write-Host "($listNum) - $susp"
            }
            # Return corresponding alibi
            $suspect = Read-Host "Which suspect do you want to interrogate?"
            switch ($suspect.ToLower()) {
                1 {
                    Write-Host "Colonel Mustard claims he was attending a dinner party."
                }
                2 {
                    Write-Host "Professor Plum asserts he was lost in thought in the library."
                }
                3 {
                    Write-Host "Miss Scarlet insists she was rehearsing lines for a play."
                }
                4 {
                    Write-Host "Mrs. White states she was organizing the pantry."
                }
                5 {
                    Write-Host "Mr. Green says he was watering the plants in the atrium."
                }
                6 {
                    Write-Host "Mrs. Peacock claims she was at a charity meeting, but her eyes dart nervously."
                }
                default {
                    Write-Host "Invalid suspect."
                }
            }
        }
        # Review option - lists all suspects, rooms, and weapons
        3 {
            Write-Host "`nSuspect Names:"
            foreach ($name in $suspects){
                Write-Host "$name"
            }

            Write-Host "`nRooms:"
            foreach ($loc in $rooms){
                Write-Host "$loc"
            }

            Write-Host "`nWeapons:"
            foreach ($item in $weapons){
                Write-Host "$item"
            }

            Write-Host "`n"
        }
        4 {
            Write-Host "Thank you for playing!"
            $gameOver = $true # Set game status to over
        }
        default {
            Write-Host "Invalid choice. Try again."
        }
    }
}
}

function end {
# Game End Scenario
Write-Host "As you confront $murderSuspect, they confess to the crime and explain their motive..."
$narrative2 = @"
Motives: 
   - The torn note found in Mr. Blackwood's pocket suggests that he was about to expose secrets that could ruin her 
   reputation and fortune. Mrs. Peacock had the most to lose from the revelation of the family's dark history involving 
   the illegitimate child.

Connections:
   - The Library Ledger reveals that an uninvited guest had a past connection to the family; this could tie back to 
   Mrs. Peacock, who may have orchestrated the invitation of this individual to create a distraction or mislead the 
   investigation.

The Poison:
   - The rare poison found in Professor Plum's study connects to Mrs. Peacock as well. As a wealthy widow with means, 
   she could have easily acquired it and used it discreetly during the dinner.

Behavior and Opportunity:
   - Throughout the investigation, Mrs. Peacock's manipulative nature and charm raised suspicion. She often deflected 
   questions and was seen in close proximity to Mr. Blackwood just before his death.

### Final Accusation:
As you piece together the evidence—especially the hidden journal detailing the illegitimate child and the threats tied to 
the family fortune—Mrs. Peacock emerges as the prime suspect. Her desperate need to protect her status and wealth makes 
her the most plausible murderer, willing to go to any lengths to keep the family's secrets buried.
"@
Write-Host $narrative2

#Final Message
Write-Host "Thanks for playing!"
}


# main function calls
function home {
cls
spl
nar
def
mur
clu
loo
}

home



<# User Interface Enhancements
Write-Host "Welcome to the Blackwood Mansion Murder Mystery!" -ForegroundColor Cyan

# Add More Rooms and Weapons
$rooms += "Observatory", "Garage"
$weapons += "Poison", "Crossbow"#>


#pwsh ./cgame.ps1 to run
