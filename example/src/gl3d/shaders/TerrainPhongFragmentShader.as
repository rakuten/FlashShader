package gl3d.shaders 
{
	import as3Shader.Var;
	import gl3d.core.Material;
	/**
	 * ...
	 * @author lizhi
	 */
	public class TerrainPhongFragmentShader extends PhongFragmentShader
	{
		public function TerrainPhongFragmentShader(material:Material,vs:PhongVertexShader) 
		{
			super(material,vs);
		}

		override public function getDiffColor():Var {
			var uv:Var = vs.uvVarying;
			var scaledUV:Var = mul(uv, 60);
			//repeat,miplinear
			var flags:Array = material.terrainTextureSets[0].flags;
			var map:Var = tex(uv, FS(), null, flags);
			mov(sub2([1,map.x,map.y,map.z]),map.w);
			var diffColor0:Var = tex(scaledUV, samplerTerrains(0),null,flags);
			var diffColor1:Var = tex(scaledUV, samplerTerrains(1),null,flags);
			var diffColor2:Var = tex(scaledUV, samplerTerrains(2),null,flags);
			var diffColor3:Var = tex(scaledUV, samplerTerrains(3), null, flags);
			var diffColor:Var=
						add2([
							mul(diffColor0,map.x),
							mul(diffColor1,map.y),
							mul(diffColor2,map.z),
							mul(diffColor3,map.w)
						]);
			mov(1,diffColor.w);//diffColor.w = 1;
			return diffColor;
		}
	}

}