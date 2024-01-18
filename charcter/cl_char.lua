-- Player creation function
function createPlayer(name, age, gender, occupation, health)
    -- Check for valid input
    if not name or not age or not gender or not occupation or not health then
        return nil, "Invalid input. All fields are required."
    end

    -- Check for valid age
    if age < 0 or age > 120 then
        return nil, "Invalid age. Age must be between 0 and 120."
    end

    -- Check for valid health
    if health < 0 or health > 100 then
        return nil, "Invalid health. Health must be between 0 and 100."
    end

    -- Create a new player object
local player = {
    name = name or "Unknown",
    age = age or 0,
    gender = gender or "Unknown",
    occupation = occupation or "Unemployed",
    health = health or 100,
    level = 1,
    inventory = {}
}

-- Validate the player data
if player.name == "" then
    print("Error: Player name cannot be empty.")
    return
elseif player.age < 0 or player.age > 120 then
    print("Error: Player age must be between 0 and 120.")
    return
elseif player.gender ~= "male" and player.gender ~= "female" then
    print("Error: Player gender must be either 'male' or 'female'.")
    return
elseif player.health < 0 or player.health > 100 then
    print("Error: Player health must be between 0 and 100.")
    return
end

-- Log the player creation
print("Player created: " .. player.name)

-- Trigger a player created event
TriggerEvent("playerCreated", player)
    }
    
    -- Perform any additional logic or actions here
    
    -- Return the created player object
    return player
end

-- UI callback for player creation
function onPlayerCreateButtonClicked()
    -- Get the input values from the UI
    local name = UI.GetNameInputValue()
    local age = UI.GetAgeInputValue()
    local gender = UI.GetGenderInputValue()
    local occupation = UI.GetOccupationInputValue()
    local health = UI.GetHealthInputValue()
    
    -- Create the player using the input values
    local player, error = createPlayer(name, age, gender, occupation, health)
    
    -- Check for errors
    if not player then
        -- Display an error message
        UI.ShowMessage("Error creating player: " .. error)
        return
    end
    
    -- Clear the input fields
    UI.ClearNameInputValue()
    UI.ClearAgeInputValue()
    UI.ClearGenderInputValue()
    UI.ClearOccupationInputValue()
    UI.ClearHealthInputValue()
    
    -- Update the player list
    UI.UpdatePlayerList(player)
    
    -- Show the player details
    UI.ShowPlayerDetails(player)
    
    -- Disable the create player button
    UI.DisableCreatePlayerButton()
    
    -- Display a success message
    UI.ShowMessage("Player created successfully!")
end