#include <stdio.h>
#include <math.h>
#define RAND_MAX 100

double random(double min, double max);

double random(double min, double max)
{

  double r = (double)rand()/RAND_MAX;
  r = r*(max-min)+min;
  return r;
}

int main() {
  int m, nn, i, j;

  double *a;
  double *b;  
  double *c;
  double *d;
  double *e;  
  double *f;
  double randV;  

  nn=90000000;

  randV = random(1, 1000);

  a = (double*) malloc(nn*sizeof(double));
  b = (double*) malloc(nn*sizeof(double));
  c = (double*) malloc(nn*sizeof(double));

  d = (double*) malloc(nn*sizeof(double));
  e = (double*) malloc(nn*sizeof(double));
  f = (double*) malloc(nn*sizeof(double));

  for (i=0; i < nn; i++) {
    a[i] = randV+i;
    b[i] = randV-i;  
    c[i] = randV*i;  
    d[i] = randV;
    e[i] = randV;  
    f[i] = randV;  

  }

  //m = 1000000;
  m =   3000;

  #pragma omp parallel for
  for (j=0; j < m; j++) {
    for (i=0; i < nn; i++) {
      a[i]=b[i]+c[i];
      b[i]=a[i]+c[i];
      c[i]=a[i]+b[i]; 
      //d[i]=cos(a[i])+sin(b[i]); 
      //e[i]=cos(c[i])+sin(b[i]); 
      //f[i]=cos(d[i])+sin(a[i]); 
    }
  }

  free(a);
  free(b);
  free(c);
  free(d);
  free(e);
  free(f);

  return(0);
}
