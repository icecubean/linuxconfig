-- Emacs-like keyboard configuration for Ion, version 3.
-- Written by Matthieu MOY (Matthieu.Moy@imag.fr) on February 15, 2005.
-- No copyright.

-- Copy this file in your ~/.ion3/ directory
-- Add the line
-- dopath("emacs-bindings")
-- At the *end* of your ~/.ion3/cfg_ion.lua file.

-- Comments/Feedback welcome.

dopath("collapse")


defbindings("WIonWS", {
               kpress(MOD1.."Tab", nil),
               submap(DEFAULT_MOD.."x", {
                         kpress("AnyModifier+O",
                                "WIonWS.goto_dir(_,right)"),
                         -- Download it from http://modeemi.cs.tut.fi/~tuomov/ion/scripts/collapse.lua
                         kpress("AnyModifier+1",
                                "collapse.collapse(_)"),
                         kpress("AnyModifier+2",
                                "WIonWS.split_at(_, _sub, 'bottom', true)"),
                         kpress("AnyModifier+3",
                                "WIonWS.split_at(_, _sub, 'right', true)"),
                         submap(DEFAULT_MOD.."x", {
                                   kpress("AnyModifier+2",
                                          "WIonWS.split_at(_, _sub, 'floating:bottom', true)"),
                                   kpress("AnyModifier+3",
                                          "WIonWS.split_at(_, _sub, 'floating:right', true)"),
                                }),
                         kpress("AnyModifier+0",
                                "WIonWS.unsplit_at(_, _sub)"),
                         kpress("AnyModifier+k",
                                "WRegion.rqclose_propagate(_, _sub)"),
                         kpress("AnyModifier+b",
                                "mod_query.query_attachclient(_)"),
                      }),
            })


-- in case of nested workspaces, switch next/previous at the top
-- level.
function moy_switch_next(frame)
   if obj_is(frame:parent(),"WFrame") then
      moy_switch_next(frame:parent())
   else
      frame:switch_next()
   end
end

function moy_switch_prev(frame)
   if obj_is(frame:parent(),"WFrame") then
      moy_switch_prev(frame:parent())
   else
      frame:switch_prev()
   end
end

defbindings("WMPlex", {
               kpress(DEFAULT_MOD.."Tab", "moy_switch_next(_)"),
               kpress(DEFAULT_MOD.."Shift+Tab", "moy_switch_prev(_)"),
               kpress(DEFAULT_MOD.."colon", "mod_query.query_lua(_)"),
               kpress(DEFAULT_MOD.."exclam", "mod_query.query_exec(_)"),
               kpress(DEFAULT_MOD.."space", "WRegion.toggle_tag(_sub)"),
               kpress(DEFAULT_MOD.."Control+space", "WFrame.attach_tagged(_)"),
            })

defbindings("WScreen", {
               kpress(DEFAULT_MOD.."colon", "mod_query.query_lua(_)"),
               kpress(DEFAULT_MOD.."exclam", "mod_query.query_exec(_)"),
            })

defbindings("WEdln", {
               kpress("Control+K", "WEdln.kill_to_eol(_)"),
               kpress("Control+space", "WEdln.set_mark(_)"),
               kpress("Control+W", "WEdln.cut(_)"),
               kpress("Control+Y", "WEdln.paste(_)"),
            })
