package gl3d.shaders.posts 
{
	import flash.display3D.Context3D;
	import flash.display3D.Context3DProgramType;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import as3Shader.AS3Shader;
	import gl3d.core.Camera3D;
	import gl3d.core.renders.GL;
	import gl3d.core.Material;
	import gl3d.core.Node3D;
	import gl3d.core.shaders.GLAS3Shader;
	import gl3d.core.shaders.GLShader;
	import gl3d.shaders.PhongFragmentShader;
	import gl3d.shaders.PhongVertexShader;
	import gl3d.core.View3D;
	/**
	 * ...
	 * @author lizhi
	 */
	public class PostGLShader extends GLShader
	{
		private var vshader:GLAS3Shader;
		private var fshader:GLAS3Shader;
		
		public function PostGLShader(vshader:GLAS3Shader=null,fshader:GLAS3Shader=null) 
		{
			this.fshader = fshader;
			this.vshader = vshader;
			
		}
		
		override public function getVertexShader(material:Material):GLAS3Shader {
			vshader=vshader||new PostVertexShader();
			return vshader;
		}
		
		override public function getFragmentShader(material:Material):GLAS3Shader {
			fshader=fshader||new PostFragmentShader();
			return fshader;
		}
		
		/*override public function preUpdate(material:Material):void {
			super.preUpdate(material);
			textureSets[0] = material.diffTexture;
			buffSets.length = 0;
			buffSets[0] = material.node.drawable.pos;
			buffSets[1] = material.node.drawable.uv;
		}*/
		
		/*override public function update(material:Material):void 
		{
			super.update(material);
			var context:GL = material.view.renderer.gl3d;
			if (programSet) {
				var node:Node3D = material.node;
				context.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, Vector.<Number>([material.view.time,material.view.stage3dWidth,material.view.stage3dHeight,0]));
				context.setProgramConstantsFromVector(Context3DProgramType.VERTEX, vshader.constMemLen, vshader.constPoolVec);
				context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0, node.world,true);
				context.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, fshader.constMemLen, fshader.constPoolVec);
				//trace(fshader.constMemLen,fshader.constPool);
				context.drawTriangles(node.drawable.index.buff);
			}
		}*/
		
	}

}