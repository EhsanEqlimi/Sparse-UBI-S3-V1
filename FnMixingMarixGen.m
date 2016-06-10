function [A,kmax]=FnMixingMarixGen(m,n,th,itrmax)
k=0;itr=0;
A = FnNormalizer(randn(m,n));
[R,k] = k_rank(A);
bestA=A;kmax=k;
while k<th && itr<itrmax
    itr=itr+1;
    A = FnNormalizer(randn(m,n));
    [R,k] = k_rank(A);
    if k>kmax
        bestA=A;
        kmax=k;
    end
end
A=bestA;