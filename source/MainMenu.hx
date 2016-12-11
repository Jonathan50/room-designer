package;

import openfl.*;
import openfl.display.*;
import openfl.geom.*;
import openfl.events.*;

class MainMenu extends GameState {
  public function new (game:Game) {
    super (game);
    addEventListener(GameStateEvent.DRAW_STATE, onDrawMenu);
  }

  private var verticalIndex:Float;
  
  private function onDrawMenu(event:Event):Void {
    verticalIndex = 0;
    addLogo();
    addButtons();
  }

  private function addLogo():Void {
    // Scale the logo to fit on the stage.
    var logo:BitmapData = Assets.getBitmapData("assets/logo.png");
    var scale:Float = stage.stageWidth / logo.width;
    var matrix:Matrix = new Matrix();
    var scaledLogo:BitmapData =
        new BitmapData(Math.floor(logo.width * scale),
                       Math.floor(logo.height * scale),
                       true, 0x000000);
    matrix.scale(scale, scale);
    scaledLogo.draw(logo, matrix, null, null, null, true);
    // Display the scaled logo.
    addChild(new Bitmap(scaledLogo));
    verticalIndex += logo.height * scale;
  }

  private function addButtons():Void {
    // Make all the buttons.
    var buttons:Array<Button> =
        [new Button("Play!", onPlayPressed)];
    // Display them all.
    for (button in buttons) {
      button.x = (stage.stageWidth - button.width) / 2;
      button.y = verticalIndex;
      addChild(button);
      verticalIndex += button.height + 4;
    }
  }

  private function onPlayPressed(event:Event):Void {
    game.useState(new Room(game));
  }
}
