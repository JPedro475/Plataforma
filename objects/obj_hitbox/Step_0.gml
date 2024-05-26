var _outro = instance_place(x, y, obj_entidade);
var _lista = ds_list_create();
var _qntd = instance_place_list(x, y, obj_entidade, _lista, 0);


//Adicionando todo objeto_inimigo com colisão na lista de aplicar dano
for (var _i = 0; _i < _qntd; _i++)
{
	var _atual = _lista[| _i];
	
	
	//Checando se o objeto esta invencivel
	
	if(_atual.invencivel)
	{
		continue;
	}
	
	if(object_get_parent(_atual.object_index) != object_get_parent(pai.object_index))
	{
		//Checa SE puder da dano no objeto
		
		//Checa se o _atual ja está na lista
		var _pos = ds_list_find_index(aplicar_dano, _atual);
		if (_pos == -1)
		{
			//_atual não está na lista de dano
			//Adiociona a lista de dano
			ds_list_add(aplicar_dano, _atual);
		}
	
	}
}

//Aplicando o dano
var _tam = ds_list_size(aplicar_dano);

for (var _i = 0; _i < _tam; _i++)
{
	_outro = aplicar_dano[| _i].id;
	
	if(_outro.vida_atual > 0)
	{
		_outro.estado = "hit";
		_outro.image_index = 0;
		_outro.vida_atual -= dano;
		
		//Check do hitbox
		if(object_get_parent(_outro.object_index) == obj_inimigo_pai)
		{
			//Screenshake no inimigo
			screenshake(2);
		}
	}
		/*if (_outro.estado !="defesa")
		{
			_outro = aplicar_dano[| _i].id;
			
			if(_outro.vida_atual > 0)
			{
				_outro.estado = "hit";
				_outro.image_index = 0;
				_outro.vida_atual -= dano;
				
				if (object_get_parent(_outro.object_index) == obj_inimigo_pai)
				{
					screenshake(2);
				}
			}
		}*/

}
instance_destroy();

