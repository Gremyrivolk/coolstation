
/**
	* Returns the curent turf atom/x is on, through any number of nested layers
	*
	* See: <http://www.byond.com/forum/?post=2110095>
	*/
#define get_turf(x) get_step(x, 0)

/// returns a list of all neighboring turfs in cardinal directions.
#define getneighbours(x) (list(get_step(x, NORTH), get_step(x, EAST), get_step(x, SOUTH), get_step(x, WEST)))

/// Returns true if turf x is in a simulated atmos area. Some azone-y stuff also uses this because we haven't split it cleanly (yet)
#define issimulatedturf(x) (isturf(x) && !istype(x, /turf/space) && (x.loc:is_atmos_simulated == TRUE))

/// Returns true if turf x is in a construction allowed area
#define isconstructionturf(x) (x.loc:construction_allowed == TRUE)

/// Returns true if x is a floor type
#define isfloor(x) (istype(x, /turf/floor))

/// Returns true if x is a reinforced wall
#define isrwall(x) (istype(x,/turf/wall/r_wall)||istype(x,/turf/wall/auto/reinforced)||istype(x,/turf/wall/false_wall/reinforced))

/**
	* Creates typepaths for an unsimulated turf, a simulated turf, an airless simulated turf, and an airless unsimulated turf at compile time.
	*
	* `_PATH` should be an incomplete typepath like `purple/checker` or `orangeblack/side/white`
	*
	* It will automatically be formatted into a correct typepath, like `/turf/floor/purple/checker`
	*
	* `_VARS` should be variables/values that the defined type should have.
	*
	* It should be formatted like:
	*
	*```
	*	foo = 1\
	*	bar = "baz")
	*```
	*
	* EXAMPLE USAGES:
	*
	*```
	*	DEFINE_FLOORS(orangeblack/side/white,
	*		icon_state = "cautionwhite")
	*```
	*
	*```
	*	DEFINE_FLOORS(damaged1,
	*		icon_state = "damaged1";\
	*		step_material = "step_plating";\
	*		step_priority = STEP_PRIORITY_MED)
	*```
	*
	* NOTE: this macro isnt for every situation. if you need to define some procs on a turf, don't use this
	* macro and make sure to mirror your changes across turf/floors_airless.dm, turf/floors_unsimulated.dm
	* and turf/floors.dm.
	*/
#define DEFINE_FLOORS(_PATH, _VARS) \
	/turf/floor/_PATH{_VARS};


/// Creates typepaths for a `/turf/floor/_PATH` and a `/turf/floor/_PATH` with vars from `_VARS`
#define DEFINE_FLOORS_SIMMED_UNSIMMED(_PATH, _VARS) \
	/turf/floor/_PATH{_VARS};

