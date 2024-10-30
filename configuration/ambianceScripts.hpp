/*
	Ambiance scripts

	Author: Joecuronium

	HOW TO USE:

	The ambiance script suites contains various tools that can be used by Zeus during mission runtime to achieve certain effects.

	Currently, the following are implemented:

	-AAA firing into the air randomly
	-Artillery guns firing (projectile gets deleted after a certain time)
	-Searchlights scanning the sky

	Usage:

	Uncomment the #define line below and reload the mission. 
	In the Zeus interface new modules will be added under [CAFE3 Ambiance]. You can plop those onto any unit, tho the desired effect will only be on unit types that fit the module used (e.g. putting the AAA module onto a infantry soldier wont have much effect).
	The first module can be used to toggle the suite on and off dynamically, by default it is disabled and needs to be enabled in mission by playing the module. This is done so that guns dont fire prematurely.
*/

// Enable ambient fire scripts.
// To disable the scripts, comment-out or delete the line below.

// #define ENABLE_AMBIANCE_SCRIPTS

