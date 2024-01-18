-- Menu function
function showMenu()
    print("1. Create Player")
    print("2. View Player")
    print("3. Edit Player")
    print("4. Delete Player")
    print("5. Exit")
    
    local choice = io.read("*n") -- read a number from the user
    
    if choice == 1 then
        -- Call your function to create a player
        createPlayer()
    elseif choice == 2 then
        -- Call your function to view a player
        viewPlayer()
    elseif choice == 3 then
        -- Call your function to edit a player
        editPlayer()
    elseif choice == 4 then
        -- Call your function to delete a player
        deletePlayer()
    elseif choice == 5 then
        -- Exit the menu
        print("Exiting...")
    else
        print("Invalid choice. Please choose a number between 1 and 5.")
        showMenu() -- show the menu again
    end
end

-- Call the menu function
showMenu()