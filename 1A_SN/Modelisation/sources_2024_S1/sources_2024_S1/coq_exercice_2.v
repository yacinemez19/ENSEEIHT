Require Import Naturelle.
Section Session1_2024_Logique_Exercice_2.

Variable A B C : Prop.

Theorem Exercice_2_Naturelle : ((A /\ B) -> C) -> ((A -> C) \/ (~B)).
Proof.
I_imp H.
E_ou (B) (~ B).
TE.
I_imp H1.
I_ou_g.
I_imp H2.
E_imp (A /\ B).
Hyp H.
I_et.
Hyp H2.
Hyp H1.
I_imp H1.
I_ou_d.
Hyp H1.
Qed.

Theorem Exercice_2_Coq : ((A /\ B) -> C) -> ((A -> C) \/ (~B)).
Proof.
intro.
destruct (classic B).
left.
intro.
cut (A /\ B).
exact H.
split.
exact H1.
exact H0.
right.
exact H0.
Qed.

End Session1_2024_Logique_Exercice_2.

