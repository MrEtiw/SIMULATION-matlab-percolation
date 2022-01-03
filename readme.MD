# Simulation of Percolating Systems, using Matlab

**CONTEXT**: Third year engineering physics baccalaureate capstone project

**DESCRIPTION**:
- Intends to simulate percolating systems.
- Given a probability for each element of a specific lattice, what is the probability that there exists a percolating path through the system?
- Tested different lattice (square, triangular, hexagonal, etc.) to study effect on percolating probability.
- Implement recursive and clustering identifcation approaches to identify percolation paths.
- Studied time and computational complexity of implemented algorithms.
- Explanations and comments written in French.

**LANGUAGES / TECH**: Matlab




**ADDITIONAL INFOS**
******
Project made long before diving into computer science.
Fun project intended to simulate physics processes
******



Les fonction ''courbe_p_pc'' génère les courbes de la probabilité de percolation en fonction de la probabilité d'occupation des sites pour les trois types de treillis. 

Les fonctions se nommant ''voisin'' identifient les voisins d'un élément selon la définition du treillis

Les fonctions ''CCL'' identifie les amas selon la définition du treillis

Les fonctions ''verif_percolation'' identifie s'il y a percolation en identifiant les amas

Les fonctions ''verif_percol_recursion'' vérifie si un système percole en utilisant les fonctions recursives de type ''next_start''

Les fonctions ''next_start'' sont les algorithmes de recursion d'exploration en profondeur

Les fonctions ''path_sample'' sont les algorithmes de recherche de chemin en regardant tous les voisins en premier (breadth first search)

''Video_carre'' est le script utilisé pour générer la vidéo présente dans notre présentation orale.

Les fonctions ''temps'' analysent la complexité temporelle de nos algorithmes




	
