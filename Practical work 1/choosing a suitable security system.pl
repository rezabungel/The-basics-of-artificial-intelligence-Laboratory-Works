/*
Экспертная система выбора решений для обеспечения
безопасности на языке SWI-Prolog
*/

% Факты.
system(name('5G'),
       fstec(false),
       cost(1200),
       rate(4.5),
       opensource(true),
       antivirus(true)).

system(name('CarGreen'),
       fstec(true),
       cost(500),
       rate(4.2),
       opensource(false),
       antivirus(false)).

system(name('FiveGold'),
       fstec(false),
       cost(430),
       rate(3.9),
       opensource(true),
       antivirus(false)).

system(name('Qwerty'),
       fstec(true),
       cost(999),
       rate(3.1),
       opensource(false),
       antivirus(true)).

system(name('Rare'),
       fstec(true),
       cost(1000),
       rate(5),
       opensource(true),
       antivirus(false)).

% Правила.
fstec_filter_and_rate(Name):-
 system(name(Name),fstec(X),_,rate(Y),_,_),
 X=true,
 Y>4.

with_opensource(Name):-
 system(name(Name),_,_,_,opensource(true),_).

use_without_antivirus(Name):-
 system(name(Name),_,_,_,_,antivirus(false)).

cost_filter(Name):-
 system(name(Name),_,cost(X),_,_,_),
 X>800.

% Примеры запросов (пишутся в консоль)
%
% Запрос №1
% ?- fstec_filter_and_rate(Name).
%
% Запрос №2
% ?- with_opensource(Name).
%
% Запрос №3
% ?- use_without_antivirus(Name).
%
% Запрос №4
% ?- cost_filter(Name).