function BAS=FnBiasedAnglesSum(Ahat,A)
n=size(A,2);
BAS=0;
for e=1:n
    dd=acos(Ahat(:,e)'* A(:,e));
    BAS=dd+BAS;
end
BAS=abs(BAS)
