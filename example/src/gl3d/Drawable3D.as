package gl3d 
{
	import flash.display3D.Context3D;
	import gl3d.meshs.Meshs;
	/**
	 * ...
	 * @author lizhi
	 */
	public class Drawable3D 
	{
		private var _pos:VertexBufferSet;
		private var _norm:VertexBufferSet;
		private var _tangent:VertexBufferSet;
		private var _uv:VertexBufferSet;
		private var _random:VertexBufferSet;
		private var _targetPosition:VertexBufferSet;
		public var index:IndexBufferSet;
		public function Drawable3D() 
		{
			
		}
		
		public function update(context:Context3D):void 
		{
			/*if (pos) {
				pos.update(context);
			}if (norm) {
				norm.update(context);
			}if (uv) {
				uv.update(context);
			}if (tangent) {
				tangent.update(context);
			}if (random) {
				random.update(context);
			}*/
			if (index) {
				index.update(context);
			}
		}
		
		public function get pos():VertexBufferSet 
		{
			return _pos;
		}
		
		public function set pos(value:VertexBufferSet):void 
		{
			_pos = value;
		}
		
		public function get norm():VertexBufferSet 
		{
			if (_norm==null) {
				_norm=Meshs.computeNormal(this);
			}
			return _norm;
		}
		
		public function set norm(value:VertexBufferSet):void 
		{
			_norm = value;
		}
		
		public function get tangent():VertexBufferSet 
		{
			if (_tangent==null) {
				_tangent = Meshs.computeTangent(this);
			}
			return _tangent;
		}
		
		public function set tangent(value:VertexBufferSet):void 
		{
			_tangent = value;
		}
		
		public function get uv():VertexBufferSet 
		{
			if (_uv == null) {
				_uv = Meshs.computeUV(this);
			}
			return _uv;
		}
		
		public function set uv(value:VertexBufferSet):void 
		{
			_uv = value;
		}
		
		public function get random():VertexBufferSet 
		{
			if (_random==null) {
				_random = Meshs.computeRandom(this);
			}
			return _random;
		}
		
		public function set random(value:VertexBufferSet):void 
		{
			_random = value;
		}
		
		public function get targetPosition():VertexBufferSet 
		{
			if (_targetPosition==null) {
				_targetPosition = Meshs.computeTargetPosition(this);
			}
			return _targetPosition;
		}
		
		public function set targetPosition(value:VertexBufferSet):void 
		{
			_targetPosition = value;
		}
		
	}

}