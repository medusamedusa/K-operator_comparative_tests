% approach computing Kl only

q = 10; % 10 training sets
p = 10; % 10 test sets

% generate (p+q) pairs of matrices
for ii=1:(p+q)
    [G{ii}, Gk{ii}] = artificial_data_generator(5);
end

I = eye(5);

% use q for training
F = [];
rhs = [];
for ii=1:q
    F = [F;kron(I,G{ii}), kron(G{ii}',I)];
    rhs = [rhs; reshape(Gk{ii},5^2,1)];
end

v = F\rhs;

Ker = reshape(v(1:(5^2)),5,5);
Kell = reshape(v((5^2+1):end),5,5);

% test training set / test set
for ii=1:(p+q)
    err(ii)=norm(Gk{ii}-Kell*G{ii}-G{ii}*Ker)/norm(Gk{ii})
end

mean(err(1:q))
mean(err(q+1:q+p))




%%% Local Variables: 
%%% flyspell-mode:nil
%%% mode:flyspell-prog
%%% ispell-local-dictionary: "american"
%%% mode:matlab
%%% End: 
