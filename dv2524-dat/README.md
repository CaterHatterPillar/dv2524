magicinstrprofileeach.dat
===
Original magic instruction profiling. Execution of one thousand empty magic instructions, each being profiled.

profile.dat
===
Profiling of the profiling method used to time from within Target machine. Simply writing start and stop, respectively, to the serial console - without doing anythin in-between. Performed in a similar fashion to paramagic.ms, without the magic instruction. As such, paraprofile.ms contains measurements of the overhead one may expect using this method.

magicinstrprofileall.dat
===
Better measurements of time overhead whilst using magic instructions. Profiles the execution of 1000 magic instructions.
The above is performed 1000 times to collect avg data.