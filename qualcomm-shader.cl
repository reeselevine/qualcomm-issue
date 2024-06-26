typedef struct Params {
  uint choice;
  uint x;
  uint y; 
} Params;

__kernel void test(__global Params * params, __global uint * mem) {
    if (params->choice % 2 == 0) {
      mem[get_global_id(0) + params->choice] = params->x;
    } else {
      mem[get_global_id(0) + params->choice] = params->y;
    }
}
