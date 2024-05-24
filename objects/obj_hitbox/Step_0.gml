var _outro = instance_place(x, y, obj_entidade);

//Se estiver tocando no inimigo
if (_outro)
{
	//Não está tocando no "pai"
	if(_outro.id != pai)
	{
		if (_outro.vida_atual > 0)
		{
			_outro.estado = "hit";
			_outro.image_index = 0;
			_outro.vida_atual -= dano;
			instance_destroy();
		}
		
	}
}