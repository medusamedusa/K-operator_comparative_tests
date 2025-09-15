% approach computing K_cdot only

% generate a pair of matrices
[G, Gk] = artificial_data_generator(5);
% generate a second pair for tests
[G2, Gk2] = artificial_data_generator(5);

Kcdot = Gk./G;

norm(Gk-Kcdot.*G)
norm(Gk2-Kcdot.*G2) % fails obviously since K_cdot is over-fitted




%%% Local Variables: 
%%% flyspell-mode:nil
%%% mode:flyspell-prog
%%% ispell-local-dictionary: "american"
%%% mode:matlab
%%% End: 
