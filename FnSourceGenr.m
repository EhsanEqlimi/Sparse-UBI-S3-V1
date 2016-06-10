function [S]=FnSourceGenr(n,m,T,k)
S=rand(n,T);
P=nchoosek(1:n,n-m+1);
for i=1:size(P,1)
    SS=ones(1,n);SS(:,P(i,:))=0;
    PP(i,:)= find(SS);
end
PP(end,end+1)=0;
for i=1:T
    ZeroGenVector=randperm(n);
    ZeroGenVector=ZeroGenVector(1:n-k);
    %%
    S(ZeroGenVector,i)=0;
    idx(:,i)=find(S(:,i));
   id= find(   1./idx(:,i)'*PP(:,1:end-1)'-(size(PP,2)-1) ==0);
    PP(id,end)=PP(id,end)+1;
end



