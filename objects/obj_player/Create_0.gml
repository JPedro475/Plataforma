/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _cam = instance_create_layer(x, y, layer, obj_camera);
_cam.alvo = id;
randomize();

// Inherit the parent event
event_inherited();
//Movimento e mecanicas


vida = 5;
vida_atual = vida;

max_velh = 4;
max_velv = 6;
massa = 1.2;


//mostra_estado = true;
//Combo // Ataque
combo = 0;
dano = noone;
ataque = 1;
permitir_atk = true;
ataque_multi = 1;
buff = room_speed;

//Invencibilidade
invencivel = false;
invencivel_timer = room_speed * 3;
tempo_invencivel = invencivel_timer;