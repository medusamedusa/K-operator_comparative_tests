% approach computing Kl only

% generate a pair of matrices
[G, Gk] = artificial_data_generator(5);
% generate a second pair for tests
[G2, Gk2] = artificial_data_generator(5);

Ker = G\Gk;

norm(Gk-G*Ker)
norm(Gk2-G2*Ker) % fails obviously since Kell is over-fitted




%%% Local Variables: 
%%% flyspell-mode:nil
%%% mode:flyspell-prog
%%% ispell-local-dictionary: "american"
%%% mode:matlab
%%% End: 
