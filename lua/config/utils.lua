local M = {}

-- Create a state variable to track the current position in the cycle
M.recenter_state = 0 -- 0: initial, 1: center, 2: top, 3: bottom

function M.recenter_top_bottom()
  -- Cycle through positions
  M.recenter_state = (M.recenter_state + 1) % 3

  -- Apply the corresponding positioning command
  if M.recenter_state == 0 then
    -- Move current line to center
    vim.cmd("normal! zz")
  elseif M.recenter_state == 1 then
    -- Move current line to top
    vim.cmd("normal! zt")
  else -- M.recenter_state == 2
    -- Move current line to bottom
    vim.cmd("normal! zb")
  end
end

return M
