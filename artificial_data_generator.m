function [G, Gk] = artificial_data_generator(n);

if (nargin<1)
    n = 5;
end

doagain = true;

while (doagain)
    G = 0.6*(tril(rand(n)-0.5,-1));
    G = G + tril(G,-1)';
    G = G-diag(G)+eye(n);
    doagain = false;
    if (sum(sum(abs(G)>0.3))>n)
        doagain = true;
    end
    if (sum(eig(G)<0)>0)
        doagain = true;
    end
end
    
doagain = true;

while (doagain)
    Gk = 1.6*(tril(rand(n)-0.5,-1));
    Gk = Gk + tril(Gk,-1)';
    Gk = Gk-diag(Gk)+eye(n);
    Gk = Gk.*sign(G).*sign(Gk);
    doagain = false;
    if (sum(sum(abs(Gk)>0.6))<=n)
        doagain = true;
    end
    if (sum(eig(Gk)<0)>0)
        doagain = true;
    end
end



%%% Local Variables: 
%%% flyspell-mode:nil
%%% mode:flyspell-prog
%%% ispell-local-dictionary: "american"
%%% mode:matlab
%%% End: 
