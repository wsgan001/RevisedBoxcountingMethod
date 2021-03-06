%ASYMPTOTH0SCRIPT
close all
syms N k positive

maxi=10;
b=sym(zeros(1,maxi));
b0=sym(1);
for j=1:maxi
    c=k*(k+j)/(k+N)/gamma(j+1);
    for i=1:j-1
        c=c*(k+i)^2/(k+N+i);
    end
    b(j)=c;
end
s1=b0*log(k);
s2=b0;
for j=1:maxi
    s1=s1+b(j)*log(k+j);
    s2=s2+b(j);
end
H0=s1/s2;
L0=factor(expand(limit(H0,N,inf)))
L1=factor(expand(limit((H0-L0)*N,N,inf)))
LIM1=limit(L1/(k),k,inf)
L2=factor(expand(limit((H0-L0-L1/N)*N^2,N,inf)))
LIM2=limit(L2/(k)/(k),k,inf)
L3=factor(expand(limit((H0-L0-L1/N-L2/N^2)*N^3,N,inf)))
LIM3=limit(L3/(k)/(k)/(k),k,inf)
ezplot(L2/(k^2),[1 10])
