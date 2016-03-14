type options =
  <
    volume        : float Js.readonly_prop ;
    scalingMode   : int Js.readonly_prop
  > Js.t

type scaling_mode_type          = Scale_to_fit | Scale_to_fit_with_cropping
let scale_to_fit                = Scale_to_fit
let scale_to_fit_with_cropping  = Scale_to_fit_with_cropping
let scaling_mode_to_int s       = match s with
  | Scale_to_fit                -> 1
  | Scale_to_fit_with_cropping  -> 2

let create_options ?(volume=0.5) ?(scaling_mode=Scale_to_fit) () =
  object%js
    val volume      = if volume > 1.0 then 1.0 else if volume < 0. then 0. else
                      volume
    val scalingMode = scaling_mode_to_int scaling_mode
  end

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
