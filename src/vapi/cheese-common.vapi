/* cheese-common.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Cheese", lower_case_cprefix = "cheese_")]
namespace Cheese
{
	[CCode (cheader_filename = "cheese-effect.h")]
	public class Effect : GLib.Object
	{
		[CCode (has_construct_function = false)]
		public Effect ();
		[NoAccessorMethod]
		public string name {owned get; set;}
		[NoAccessorMethod]
		public string pipeline_desc {owned get; set;}
		[NoAccessorMethod]
		public Gst.Element control_valve {get; set;}

		public void enable_preview();
		public void disable_preview();
		public bool is_preview_connected();
	}

  [CCode (cheader_filename = "cheese-camera.h")]
  public class Camera : GLib.Object
  {
    [CCode (has_construct_function = false)]
    public Camera (Clutter.Texture video_texture, string camera_device_name, int x_resolution, int y_resolution);
    public bool                        get_balance_property_range (string property, double min, double max, double def);
    public unowned GLib.PtrArray       get_camera_devices ();
    public unowned Cheese.VideoFormat  get_current_video_format ();
    public int                         get_num_camera_devices ();
    public unowned Cheese.CameraDevice get_selected_device ();
    public unowned GLib.List           get_video_formats ();
    public bool                        has_camera ();
    public void                        play ();
    public void                        set_balance_property (string property, double value);
    public void                        set_device_by_dev_file (string file);
    public void                        set_device_by_dev_udi (string udi);
    public void                        set_effect (Cheese.Effect effect);
	public void                        toggle_effects_pipeline (bool active);
	public void                        connect_effect_texture (Cheese.Effect effect, Clutter.Texture texture);
    public void                        set_video_format (Cheese.VideoFormat format);
    public void                        setup (string udi) throws GLib.Error;
    public void                        start_video_recording (string filename);
    public void                        stop ();
    public void                        stop_video_recording ();
    public bool                        switch_camera_device ();
    public bool                        take_photo (string filename);
    public bool                        take_photo_pixbuf ();
    [NoAccessorMethod]
    public string device_name {owned get; set;}
    [NoAccessorMethod]
    public Cheese.VideoFormat format {owned get; set;}
    [NoAccessorMethod]
    public void *video_texture {get; set;}
    public virtual signal void photo_saved ();
    public virtual signal void photo_taken (Gdk.Pixbuf pixbuf);
    public virtual signal void video_saved ();
    public virtual signal void state_changed (Gst.State new_state);
  }
  [CCode (cheader_filename = "cheese-camera-device.h")]
  public class CameraDevice : GLib.Object, GLib.Initable
  {
    [CCode (has_construct_function = false)]
    public CameraDevice (string device_id, string device_file, string product_name, int api_version) throws GLib.Error;
    public unowned Cheese.VideoFormat get_best_format ();
    public unowned Gst.Caps           get_caps_for_format (Cheese.VideoFormat format);
    public unowned string             get_device_file ();
    public unowned GLib.List          get_format_list ();
    public unowned string             get_id ();
    public unowned string             get_name ();
    public unowned string             get_src ();
    [NoAccessorMethod]
    public int api {get; construct;}
    public string device_file {get; construct;}
    [NoAccessorMethod]
    public string device_id {owned get; construct;}
    public string name {get; construct;}
  }

  [CCode (cheader_filename = "cheese-camera-device-monitor.h")]
  public class CameraDeviceMonitor : GLib.Object
  {
    [CCode (has_construct_function = false)]
    public CameraDeviceMonitor ();
    public void                coldplug ();
    public virtual signal void added (string id, string device_file, string product_name, int api_version);
    public virtual signal void removed (string id);
  }


  [CCode (cheader_filename = "cheese-fileutil.h")]
  public class FileUtil  : GLib.Object
  {
    [CCode (cname = "cheese_fileutil_new", has_construct_function = false)]
    public FileUtil ();
    [CCode (cname = "cheese_fileutil_get_log_path")]
    public unowned string get_log_path ();
    [CCode (cname = "cheese_fileutil_get_new_media_filename")]
    public unowned string get_new_media_filename (Cheese.MediaMode mode);
    [CCode (cname = "cheese_fileutil_get_path_before_224")]
    public unowned string get_path_before_224 ();
    [CCode (cname = "cheese_fileutil_get_photo_path")]
    public unowned string get_photo_path ();
    [CCode (cname = "cheese_fileutil_get_video_path")]
    public unowned string get_video_path ();
    [CCode (cname = "cheese_fileutil_reset_burst")]
    public void reset_burst ();
  }

  [CCode (cheader_filename = "cheese-flash.h")]
  public class Flash : GLib.Object
  {
    [CCode (has_construct_function = false)]
    public Flash (Gtk.Widget parent);
    public void fire ();
  }

  [CCode (cheader_filename = "cheese-gconf.h")]
  public class GConf : GLib.Object
  {
    [CCode (has_construct_function = false)]
    public GConf ();
    [NoAccessorMethod]
    public double gconf_prop_brightness {get; set;}
    [NoAccessorMethod]
    public int gconf_prop_burst_delay {get; set;}
    [NoAccessorMethod]
    public int gconf_prop_burst_repeat {get; set;}
    [NoAccessorMethod]
    public string gconf_prop_camera {owned get; set;}
    [NoAccessorMethod]
    public double gconf_prop_contrast {get; set;}
    [NoAccessorMethod]
    public bool gconf_prop_countdown {get; set;}
    [NoAccessorMethod]
    public bool gconf_prop_enable_delete {get; set;}
    [NoAccessorMethod]
    public double gconf_prop_hue {get; set;}
    [NoAccessorMethod]
    public string gconf_prop_photo_path {owned get; set;}
    [NoAccessorMethod]
    public double gconf_prop_saturation {get; set;}
    [NoAccessorMethod]
    public string gconf_prop_selected_effects {owned get; set;}
    [NoAccessorMethod]
    public string gconf_prop_video_path {owned get; set;}
    [NoAccessorMethod]
    public bool gconf_prop_wide_mode {get; set;}
    [NoAccessorMethod]
    public int gconf_prop_x_resolution {get; set;}
    [NoAccessorMethod]
    public int gconf_prop_y_resolution {get; set;}
  }

  [Compact]
  [CCode (type_id = "CHEESE_TYPE_VIDEO_FORMAT", cheader_filename = "cheese-camera-device.h")]
  public class VideoFormat
  {
    public int height;
    public int width;
  }
  [CCode (cprefix = "CHEESE_CAMERA_EFFECT_", has_type_id = false, cheader_filename = "cheese-camera.h")]
  public enum CameraEffect
  {
    NO_EFFECT,
    MAUVE,
    NOIR_BLANC,
    SATURATION,
    HULK,
    VERTICAL_FLIP,
    HORIZONTAL_FLIP,
    SHAGADELIC,
    VERTIGO,
    EDGE,
    DICE,
    WARP
  }
  [CCode (cprefix = "CHEESE_MEDIA_MODE_", has_type_id = false, cheader_filename = "cheese-fileutil.h")]
  public enum MediaMode
  {
    PHOTO,
    VIDEO,
    BURST
  }
  [CCode (cprefix = "CHEESE_WIDGET_STATE_", cheader_filename = "cheese-fileutil.h")]
  public enum WidgetState
  {
    NONE,
    READY,
    ERROR
  }
  [CCode (cheader_filename = "cheese-countdown.h")]
  public delegate void cheese_countdown_cb_t ();
  [CCode (cheader_filename = "cheese-fileutil.h")]
  public const string PHOTO_NAME_SUFFIX;
  [CCode (cheader_filename = "cheese-fileutil.h")]
  public const string VIDEO_NAME_SUFFIX;
}