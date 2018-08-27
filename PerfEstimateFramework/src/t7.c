//#include <stdlib.h>
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

  nn=90000;

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
    d[i] = randV+i;
    e[i] = randV-i;  
    f[i] = randV*i;  
  }

  //m = 1000000;
  m = 4500000;

  #pragma omp parallel for
  for (j=0; j < m; j++) {
    for (i=0; i < nn; i++) {
      c[i]=log(a[i])/sqrt(b[i]);
    }
    for (i=0; i < nn; i++) {
      d[i]=log(e[i]/f[i]);
    }
    for (i=0; i < nn; i++) {
      b[i]=exp2(c[i])/sqrt(a[i]);
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
