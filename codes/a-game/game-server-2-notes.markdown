# Notes:
 - When the game loop is cycled clone the top item in the `STATES` stack
 - In `.calc_state` walk a pipeline calculating movements, and then scoring
    - Each step in the pipeline returns a modified copy of the state 
    - The last copy is pushed to the top of the `STATES` stack for the next iteration
 - Update every client of the new state, and sleep

## Epiphany moment:
 When walking the calculation pipeline(`.calc_state`) Start with the "stale" information in `STATES`, and apply the changes from the client requests(`CLIENTS`) on top of it in a fast-foward style.

 Know any other software that works like that?
