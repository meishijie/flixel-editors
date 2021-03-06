package com.leveluplabs.tools.animator;

import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUIPopup;
import flixel.addons.ui.FlxUIText;
import sys.FileSystem;
import systools.Dialogs;

/**
 * ...
 * @author 
 */
class Popup_Input extends FlxUIPopup
{
	public override function create():Void {
		_xml_id = "popup_input";
		
		super.create();
		
		var title:FlxUIText = cast _ui.getAsset("title");
		var body:FlxUIText = cast _ui.getAsset("body");
		
		title.text = "No path found -- first run?";
		body.text = "Please browse to your game's assets folder.";
	}
	
	#if sys
		public override function getEvent(id:String, sender:Dynamic, data:Array<Dynamic>, ?params:Array<Dynamic>):Void {
			if (params != null) {
				switch(id) {
					case "click_button":
						var param0:String = Std.string(params[0]);
						var path:String = "";
						if (param0 == "browse")
						{
							path = Dialogs.folder("Browse to your game's assets folder!", "MESSAGE!");
						}
						else if (param0 == "default")
						{
							path = "assets";
						}
						var parent = castParent();
						close();
						if (parent != null)
						{
							parent.getEvent("choose_path", this, path);
						}
				}
			}
		}
	#end
}