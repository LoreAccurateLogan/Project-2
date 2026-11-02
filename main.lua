require("L5")

local screenWidth = 500
local screenHeight = 500

local previousPositionX = 0 -- starting position X that gets updated
local previousPositionY = 0 -- starting position Y that gets updated

local currentAmountOfShapeInRow = 0

local scale = 500

local timeToChange = 5 * 30
local currentTimeToChange = timeToChange

local shapeSpacing

local borderImage = loadImage("assets/borderCircle.png")

function setup()
    frameRate(30)
    noStroke()
    size(screenWidth, screenHeight)
    drawShape()
end

function draw()
    -- Timer for regenerating the pattern
    if currentTimeToChange > 0 then
        currentTimeToChange = currentTimeToChange - 1
    else
        previousPositionY = 0
        drawShape()
        currentTimeToChange = timeToChange
        
    end
    image(borderImage, 0, 0)
end

function mouseClicked()

    save("project2_screenshot2")
end

function drawShape()
    
    local shapesPerRow = random(10, 40)
    local columns = random(2, 30)

    local shapeOffsetX = screenWidth / shapesPerRow
    local shapeOffsetY = screenHeight / columns

    for y=0, columns do
        for i=0, shapesPerRow do
            local centerX = previousPositionX
            local centerY = previousPositionY
            
            -- Dictionary for all of the colors
            local risoColors = {
                blue = {0, 120, 191},
                pink = {255, 72, 176},
                yellow = {255, 232, 0}
            }

            -- Choose a random color
            local chosenColor = random(risoColors)

            -- Make variables for the colors
            local fillColorR
            local fillColorG
            local fillColorB

            -- Assign the variables to the corresponding color values
            fillColorR = chosenColor[1]
            fillColorG = chosenColor[2]
            fillColorB = chosenColor[3]

            fill(fillColorR, fillColorG, fillColorB)

            stroke(0)
            strokeWeight(4)

            -- Randomize the spacing of the shapes
            shapeSpacing = random(10, 100)

            -- Corner roundness
            rect(centerX, centerY, (screenWidth / shapesPerRow) * scale, (screenHeight / columns) * scale, 20)

            previousPositionX = previousPositionX + shapeOffsetX + shapeSpacing
        end
        previousPositionY = previousPositionY + shapeOffsetY
        previousPositionX = 0
        
    end
    shapesPerRow = random(20, 40)
end