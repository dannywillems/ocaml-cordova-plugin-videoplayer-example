type options =
  <
    volume        : float Js.readonly_prop ;
    scalingMode   : int Js.readonly_prop
  > Js.t

type scaling_mode_type
val scale_to_fit                : scaling_mode_type
val scale_to_fit_with_cropping  : scaling_mode_type
val scaling_mode_to_int         : scaling_mode_type -> int

val create_options :  ?volume:float ->
                      ?scaling_mode:scaling_mode_type ->
                      unit -> options

class type video_player =
  object
    (* ---------------------------------------------------------------------- *)
    (* Play a video in fullscreen mode *)
    (* play [file path] *)
    method play           : Js.js_string Js.t ->
                            unit Js.meth
    (* play [file path] [options] *)
    method play_opt       : Js.js_string Js.t ->
                            options ->
                            unit Js.meth
    (* play [file path] [options] [completed_callback] *)
    method play_completed : Js.js_string Js.t ->
                            options ->
                            (unit -> unit) ->
                            unit Js.meth
    (* play [file path] [options] [completed_callback] [error_callback] *)
    method play_err       : Js.js_string Js.t ->
                            options ->
                            (unit -> unit) ->
                            (Js.js_string Js.t -> unit) ->
                            unit Js.meth
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    (* Close a played video *)
    (* close *)
    method close          : unit Js.meth
    (* ---------------------------------------------------------------------- *)
  end
