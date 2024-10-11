# Blackwood Mansion Clue Game

# Define suspects, rooms, and weapons
$suspects = @("Colonel Mustard", "Professor Plum", "Miss Scarlet", "Mrs. White", "Mr. Green", "Mrs. Peacock")
$rooms = @("Library", "Kitchen", "Ballroom", "Conservatory", "Dining Room", "Hall")
$weapons = @("Candlestick", "Dagger", "Lead Pipe", "Revolver", "Rope", "Wrench")

# Game introduction
Write-Host "Welcome to the Blackwood Mansion Murder Mystery!"
Write-Host "Can you solve the murder? Who did it, where, and with what weapon?"

# Generate the murder scenario
$murderSuspect = "Miss Scarlet"
$murderRoom = "Ballroom"
$murderWeapon = "Dagger"

# Clues for the game
$clues = @(
    "A broken vase was discovered in the dining room.",
    "A mysterious letter was found hidden in the kitchen.",
    "A black feather was found near the ballroom entrance.",
    "Footprints leading to the hall were found near a service door.",
    "A wine glass with lipstick stains was discovered in the conservatory."
)

Write-Host ($clues -join "`n")

# Randomize Clue Availability
$availableClues = $clues | Get-Random -Count 3
Write-Host "Available clues: $availableClues"
# Initialize attempts and game status
$attempts = 0
$gameOver = $false

# Game loop
while (-not $gameOver) {
    Write-Host "What would you like to do? (accuse, interrogate, exit)"
    $action = Read-Host

    switch ($action.ToLower()) {
        'accuse' {
            $attempts++
            $accusedSuspect = Read-Host "Who do you think the murderer is? (Colonel Mustard, Professor Plum, Miss Scarlet, Mrs. White, Mr. Green, Mrs. Peacock)"
            $accusedRoom = Read-Host "Where do you think the murder took place? (Library, Kitchen, Ballroom, Conservatory, Dining Room, Hall)"
            $accusedWeapon = Read-Host "What weapon do you think was used? (Candlestick, Dagger, Lead Pipe, Revolver, Rope, Wrench)"
            
            # Check the accusation
            if ($accusedSuspect -eq $murderSuspect -and $accusedRoom -eq $murderRoom -and $accusedWeapon -eq $murderWeapon) {
                Write-Host "Congratulations! You solved the mystery in $attempts attempts!"
                $gameOver = $true # Set game status to over
            } else {
                Write-Host "Your accusation is incorrect. Try again!"
            }
        }
        'interrogate' {
            $suspect = Read-Host "Which suspect do you want to interrogate?"
            switch ($suspect.ToLower()) {
                'colonel mustard' {
                    Write-Host "Colonel Mustard claims he was attending a dinner party."
                }
                'professor plum' {
                    Write-Host "Professor Plum asserts he was lost in thought in the library."
                }
                'miss scarlet' {
                    Write-Host "Miss Scarlet insists she was rehearsing lines for a play."
                }
                'mrs. white' {
                    Write-Host "Mrs. White states she was organizing the pantry."
                }
                'mr. green' {
                    Write-Host "Mr. Green says he was watering the plants in the atrium."
                }
                'mrs. peacock' {
                    Write-Host "Mrs. Peacock says she was at a meeting for the charity."
                }
                default {
                    Write-Host "Invalid suspect."
                }
            }
        }
        
        'exit' {
            Write-Host "Thank you for playing!"
            $gameOver = $true # Set game status to over
        }
        default {
            Write-Host "Invalid choice. Try again."
        }
    }
}

# Game End Scenario
Write-Host "As you confront $murderSuspect, they confess to the crime and explain their motive..."

<# Randomize Clue Availability
$availableClues = $clues | Get-Random -Count 3
Write-Host "Available clues: $availableClues"#>

# Final Message
Write-Host "Thanks for playing!"


<# User Interface Enhancements
Write-Host "Welcome to the Blackwood Mansion Murder Mystery!" -ForegroundColor Cyan

# Add More Rooms and Weapons
$rooms += "Observatory", "Garage"
$weapons += "Poison", "Crossbow"#>


#pwsh ./cgame.ps1 to run