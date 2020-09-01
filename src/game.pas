program game_name;

{$MODE objfpc}

uses cmem, raylib, math;

const
    screenWidth = 800;
    screenHeight = 450;

var
    pause : boolean = false;

begin
    {$IFDEF DARWIN}
    SetExceptionMask([exDenormalized,exInvalidOp,exOverflow,exPrecision,exUnderflow,exZeroDivide]);
    {$IFEND}
    // options 
    InitWindow(screenWidth, screenHeight, 'Game Title');
    SetTargetFPS(60);
    while not WindowShouldClose() do begin
        // pause key
        if IsKeyPressed(KEY_P) then pause := pause xor true;

        // game code
        if not pause then begin


        end;
        // rendering
        BeginDrawing();
        ClearBackground(BLACK);
        
        if pause then DrawText('paused.', screenWidth div 2, screenHeight div 2, 20, WHITE);
        EndDrawing();
    end;
    CloseWindow();
end.
