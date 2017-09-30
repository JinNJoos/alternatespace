#define SS_Init

//Call this to start the system

global.dll_SS_Init = external_define(
  "supersound.dll",
  "SS_Init",
  dll_stdcall,
  ty_string,
  0);

global.dll_SS_Unload = external_define(
  "supersound.dll",
  "SS_Init",
  dll_stdcall,
  ty_string,
  0);

global.dll_SS_LoadSound = external_define(
  "supersound.dll",
  "SS_LoadSound",
  dll_stdcall,
  ty_string,
  2,
  ty_string,
  ty_string);

global.dll_SS_PlaySound = external_define(
  "supersound.dll",
  "SS_PlaySound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_LoopSound = external_define(
  "supersound.dll",
  "SS_LoopSound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);


global.dll_SS_StopSound = external_define(
  "supersound.dll",
  "SS_StopSound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_SetSoundFreq = external_define(
  "supersound.dll",
  "SS_SetSoundFreq",
  dll_stdcall,
  ty_string,
  2,
  ty_string,
  ty_string);

global.dll_SS_SetSoundPan = external_define(
  "supersound.dll",
  "SS_SetSoundPan",
  dll_stdcall,
  ty_string,
  2,
  ty_string,
  ty_string);

global.dll_SS_SetSoundVol = external_define(
  "supersound.dll",
  "SS_SetSoundVol",
  dll_stdcall,
  ty_string,
  2,
  ty_string,
  ty_string);

global.dll_SS_FreeSound = external_define(
  "supersound.dll",
  "SS_FreeSound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_IsSoundPlaying = external_define(
  "supersound.dll",
  "SS_IsSoundPlaying",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_GetSoundPosition = external_define(
  "supersound.dll",
  "SS_GetSoundPosition",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_SetSoundPosition = external_define(
  "supersound.dll",
  "SS_SetSoundPosition",
  dll_stdcall,
  ty_string,
  2,
  ty_string,
  ty_string);

global.dll_SS_GetSoundLength = external_define(
  "supersound.dll",
  "SS_GetSoundLength",
  dll_stdcall,
  ty_string,
  1,
  ty_string);
  
global.dll_SS_GetSoundBytesPerSecond = external_define(
  "supersound.dll",
  "SS_GetSoundBytesPerSecond",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_GetSoundVol = external_define(
  "supersound.dll",
  "SS_GetSoundVol",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_GetSoundFreq = external_define(
  "supersound.dll",
  "SS_GetSoundFreq",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_GetSoundPan = external_define(
  "supersound.dll",
  "SS_GetSoundPan",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_IsSoundLooping = external_define(
  "supersound.dll",
  "SS_IsSoundLooping",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_IsSoundPaused = external_define(
  "supersound.dll",
  "SS_IsSoundPaused",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_ResumeSound = external_define(
  "supersound.dll",
  "SS_ResumeSound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

global.dll_SS_PauseSound = external_define(
  "supersound.dll",
  "SS_PauseSound",
  dll_stdcall,
  ty_string,
  1,
  ty_string);

//


if external_call(global.dll_SS_Init) = "No" then begin
  show_error("Initialization of the sound system failed!",0);
end;











#define SS_Unload

// Call this before the game ends
/*
    Use it only ONCE, and do not use ANY other SS_ scripts
    afterwards, not even SS_Init()!
*/


external_call(global.dll_SS_Unload);



#define SS_LoadSound

//Load a sound in ogg or wav format into memory

/*
argument0: filename
argument1 (optional): 1 to stream the sound instead
                        of loading it all at once.
            (default) 0 to load it all at once
*/

/*
return: sound handle if successful or "0" as string else
*/

if is_real(argument0) then return "0"
return external_call(global.dll_SS_LoadSound, argument0, string(argument1));




#define SS_PlaySound

//Play a sound (once)

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: nothing
*/

if is_real(argument0) then return "0"
return external_call(global.dll_SS_PlaySound,argument0);




#define SS_LoopSound

//Start looping a sound. It will play until you stop it.

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: nothing
*/

if is_real(argument0) then return "0"
return external_call(global.dll_SS_LoopSound,argument0);




#define SS_StopSound

//Stop a playing sound. Especially useful with looped sounds.

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: void
*/

if is_real(argument0) then return "0"
return external_call(global.dll_SS_StopSound,argument0);




#define SS_SetSoundFreq

//Set the frequency of a sound (in Hz)

/*
argument0: Sound handle as returned by LoadSound
argument1: Hz as real or string. Valid values are from 1000 Hz to 100 000 Hz
*/

/*
return: "0" as string for failure and "1" as string for success.
*/

if is_real(argument0) then return "0";
if is_string(argument1) then begin
  return external_call(global.dll_SS_SetSoundFreq,argument0,argument1);
end else begin
  return external_call(global.dll_SS_SetSoundFreq,argument0,string(argument1));
end;




#define SS_SetSoundPan

//Set the panning of a sound

/*
argument0: Sound handle as returned by LoadSound
argument1: Pan as real or string. -10 000 is full left
                                   10 000 is full right
                                   0 is centred
*/

/*
return: "0" as string for failure and "1" as string for success.
*/

if is_real(argument0) then return "0";
if is_string(argument1) then begin
  return external_call(global.dll_SS_SetSoundPan,argument0,argument1);
end else begin
  return external_call(global.dll_SS_SetSoundPan,argument0,string(argument1));
end;




#define SS_SetSoundVol

//Set the volume of a sound

/*
argument0: Sound handle as returned by LoadSound
argument1: Volume as real or string. 0 is muted, 10 000 is full volume.
*/

/*
return: "0" as string for failure and "1" as string for success.
*/

if is_real(argument0) then return "0";
if is_string(argument1) then begin
  return external_call(global.dll_SS_SetSoundVol,
                       argument0,
                       string(real(argument1)-10000)
  );
end else begin
  return external_call(global.dll_SS_SetSoundVol,
                       argument0,
                       string(argument1-10000)
  );
end;







#define SS_FreeSound

//Unload a sound from memory

//Normally not needed unless you've got a lot of sounds
//or use some very large sounds

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: nothing
*/

if is_real(argument0) then return "0"
external_call(global.dll_SS_StopSound,argument0);
return external_call(global.dll_SS_FreeSound,argument0);




#define SS_IsSoundPlaying

//Check if the specified sound is currently playing (or looping)

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: 1/0/-1 (true/false/error) as real
-1 if sound doesn't exist or there was another error

It returns 0 if the sound is paused or stopped. If you
want to check whether a sound is paused, use SS_IsSoundPaused()

If the sound is playing it returns 1.
*/

if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_IsSoundPlaying,argument0));









#define SS_IsSoundLooping

//Check if the specified playing sound is set to loop

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: true/false/-1 as real
-1 if sound doesn't exist or there was another error
*/

if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_IsSoundLooping,argument0));









#define SS_GetSoundVol

//Get the volume of a sound

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: volume as real or -1 if there was an error (ie. the sound
doesn't exist). See the script SS_SetSoundVol for valid volume range
*/

if is_real(argument0) then return "-1";
return real(external_call(global.dll_SS_GetSoundVol, argument0))+10000;




#define SS_GetSoundPan

//Get the current panning of a sound

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: panning as real
See the script SS_SetSoundPan for valid range
*/

if is_real(argument0) then return "0";
return real(external_call(global.dll_SS_GetSoundPan, argument0));






#define SS_GetSoundFreq

//Get the current frequency of a sound

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: frequency as real or -1 if there was an error (ie. the sound
doesn't exist). See the script SS_SetSoundFreq for valid range
*/

if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_GetSoundFreq, argument0));





#define SS_GetSoundPosition

//Gets the current position in bytes

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: the current position in bytes as real or an error
code less than 0 as real if there was an error (like the
sound doesn't exist)
*/

if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_GetSoundPosition,argument0));





#define SS_GetSoundLength

//Gets the length in bytes

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: an error code less than 0 as real if unsuccessful,
the length in bytes as real if successful.
*/

if is_real(argument0) then return 0;
return real(external_call(global.dll_SS_GetSoundLength,argument0));





#define SS_SetSoundPosition

//Sets the current position in bytes

/*
argument0: sound handle as returned by SS_LoadSound
argument1: new sound position in bytes as real
*/

/*
return: 0 as real if unsuccessful, 1 as real if successful
*/

if is_real(argument0) then return 0;
if is_string(argument1) then return 0;
return real(external_call(global.dll_SS_SetSoundPosition,argument0,string(argument1)))+1;





#define SS_GetSoundBytesPerSecond

//Sets the current position in bytes

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: 0 as real if unsuccessful, BPS as real if successful
*/

if is_real(argument0) then return 0;
return real(external_call(global.dll_SS_GetSoundBytesPerSecond, argument0));



#define SS_IsHandleValid

//Check if the specified sound handle is a valid sound handle
//This function is bulletproof and can be used with any value

/*
argument0: sound handle
*/

/*
return: true/false
*/

if is_real(argument0) then return -1;
switch external_call(global.dll_SS_IsSoundPlaying,argument0) begin
  case "1":   return 1;
  case "0":    return 1;
  case "-1": return 0;
end;



#define SS_IsSoundPaused

//Check if the specified sound is currently paused

/*
argument0: sound handle as returned by SS_LoadSound
*/

/*
return: true/false/-1
*/


if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_IsSoundPaused,argument0));








#define SS_PauseSound

//Pause a playing sound

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: nothing
*/



if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_PauseSound,argument0));












#define SS_ResumeSound

//Resume a paused sound
//If the sound was stopped it will start playing from the start.
//If the sound is already playng it will simply continue playing

/*
argument0: Sound handle as returned by LoadSound
*/

/*
return: 1 for success, 0 for failure
*/

if is_real(argument0) then return -1;
return real(external_call(global.dll_SS_ResumeSound,argument0));




