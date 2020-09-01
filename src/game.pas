program pong;

{$MODE objfpc}

uses raylib, raymath, math, sysutils;

const
    padding = 10;
    screenWidth = 800;
    screenHeight = 450;
    ballSpeedMin = 6;
    ballSpeedMax = 16;
    ballSize = 8;
    barSpeed = 12;
    barSize : TVector2 = (x: 8 ; y: 80);

var
    score : integer;
    reset : boolean = true;
    pause : boolean = false;
    player : TRectangle;
    ball : TVector2;
    ballSpeed : TVector2;

begin
    {$IFDEF DARWIN}
    SetExceptionMask([exDenormalized,exInvalidOp,exOverflow,exPrecision,exUnderflow,exZeroDivide]);
    {$IFEND}
    // options 
    InitWindow(screenWidth, screenHeight, 'pong');
    SetTargetFPS(60);
    while not WindowShouldClose() do begin
        // prepare to pause|reset game
        if IsKeyPressed(KEY_P) then pause := pause xor true;
        if IsKeyPressed(KEY_R) then reset := true;
        // restart game
        if reset then begin
            score := 0;
            reset := false;
            ball.x := screenWidth div 2;
            ball.y := screenHeight div 2;
            ballSpeed.x := -ballSpeedMin;
            ballSpeed.y := Randomrange(-ballSpeedMin, ballSpeedMin);
            player := RectangleCreate(round(padding), round((screenHeight div 2) - (round(barSize.y) div 2)), round(barSize.x), round(barSize.y));
        end;
        // game code
        if not pause then begin
            // colision player&ball
            if CheckCollisionCircleRec(ball, ballSize, player) then begin
                score := score + 1;
                ballSpeed.x := -ballSpeed.x;
            end;
            // player move
            if IsKeyDown(KEY_UP) then player.y := max(player.y - barSpeed, 0);
            if IsKeyDown(KEY_DOWN) then player.y := min(player.y + barSpeed, screenHeight - barSize.y);
            // ball move
            if round(ball.x) < ballSize then reset := true; // game over
            if round(ball.x) > (screenWidth - ballSize) then ballSpeed.x := max(ballSpeed.x * -1.1, -ballSpeedMax);
            if (round(ball.y) < ballSize) or (round(ball.y) > (screenHeight - ballSize)) then ballSpeed.y := -ballSpeed.y;
            ball := Vector2Add(ball, ballSpeed);
        end;
        // rendering
        BeginDrawing();
        ClearBackground(BLACK);
        DrawRectangleRec(player, WHITE);
        DrawCircleV(ball, ballSize, WHITE);
        DrawText(PChar(Format('score: %02d', [score])), padding, 0, 32, WHITE);
        if pause then DrawText('paused', padding, 32, 32, WHITE);
        EndDrawing();
    end;
    CloseWindow();
end.
