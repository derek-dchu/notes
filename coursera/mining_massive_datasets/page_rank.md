Markov chains
-------------
* Set of states `X`
* Transition matrix `P` where [formular](http://www.sciweavers.org/tex2img.php?eq=P_%7Bij%7D%20%3D%20P%28X_%7Bt%7D%3Di%20%7C%20X_%7Bt-1%7D%3Dj%29&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)
* 'pi' specifying the stationary probability of being at each state [formular](http://www.sciweavers.org/tex2img.php?eq=x%20%20%5Cin%20X&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)
* Goal is to find `pi` such that [formular](http://www.sciweavers.org/tex2img.php?eq=%5Cpi%20%3D%20P%20%5Cpi&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)

Theory of Markov chains
-----------------------
For any start vector, the power method applied to a Markov transition matrix `P` will converge to a unique positive stationary vector as long as `P` is stochastic, irreducible, aperiodic.

* Stochastic: every column sums to 1
* Aperiodic: if there doesn't exist k > 1 such that the interval between two visits to some state `s` is always a multiple of k.
* Irreducible: from any state, there is a non-zero probability of going from any one state to any another.
