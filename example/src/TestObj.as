package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.events.Event;
	import flash.geom.Point;
	import gl3d.core.Fog;
	import gl3d.core.Material;
	import gl3d.core.Node3D;
	import gl3d.core.renders.GraphicsRender;
	import gl3d.core.TextureSet;
	import gl3d.meshs.Meshs;
	import gl3d.parser.OBJParser;
	/**
	 * ...
	 * @author lizhi
	 */
	public class TestObj extends BaseExample
	{
		private var loader:OBJParser;
		
		public function TestObj() 
		{
			//view.renderer = new GraphicsRender(view);;
		}
		
		override public function initNode():void 
		{
			view.fog.mode = Fog.FOG_LINEAR;
			view.fog.fogColor = [0x84 / 0xff, 0x98 / 0xff, 0xbe / 0xff];
			view.background = 0x8498be;
			//addSky();
			var p:Node3D = new Node3D();
			p.drawable = Meshs.plane(5000);
			p.y = -2;
			p.material = new Material;
			view.scene.addChild(p);
			p.rotationX = 90;
			
			/*[Embed(source = "assets/miku.obj", mimeType = "application/octet-stream")]var c:Class;
			[Embed(source = "assets/miku.mtl", mimeType = "application/octet-stream")]var c2:Class;
			loader.target.y = -2;*/
			
			[Embed(source = "assets/yuren.obj", mimeType = "application/octet-stream")]var c:Class;
			[Embed(source = "assets/yuren.mtl", mimeType = "application/octet-stream")]var c2:Class;
			loader = new OBJParser(new c +"",false, new c2 +"");
			loader.target.scaleX = loader.target.scaleY = loader.target.scaleZ = .01;
			
			view.scene.addChild(loader.target);
		}
	}

}