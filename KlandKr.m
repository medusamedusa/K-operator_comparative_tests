% approach computing Kl only

% generate a pair of matrices
[G1, Gk1] = artificial_data_generator(5);
% generate a second pair for tests
[G2, Gk2] = artificial_data_generator(5);
% generate a third pair for tests
[G3, Gk3] = artificial_data_generator(5);
% generate a fourth pair for tests
[G4, Gk4] = artificial_data_generator(5);

I = eye(5);

F = [kron(I,G1), kron(G1',I);
     kron(I,G2), kron(G2',I)];
rhs = [reshape(Gk1,5^2,1); reshape(Gk2,5^2,1)];

v = F\rhs;

Ker = reshape(v(1:(5^2)),5,5);
Kell = reshape(v((5^2+1):end),5,5);


norm(Gk1-Kell*G1-G1*Ker)
norm(Gk2-Kell*G2-G2*Ker)
norm(Gk3-Kell*G3-G3*Ker)
norm(Gk4-Kell*G4-G4*Ker)





%%% Local Variables: 
%%% flyspell-mode:nil
%%% mode:flyspell-prog
%%% ispell-local-dictionary: "american"
%%% mode:matlab
%%% End: 
