local dap = require "dap"

-- Go debugger setup
dap.adapters.delve = function(callback, config)
  if config.mode == "remote" and config.request == "attach" then
    callback {
      type = "server",
      host = config.host or "127.0.0.1",
      port = config.port or "38697",
    }
  else
    callback {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
        detached = vim.fn.has "win32" == 0,
      },
    }
  end
end

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = function()
      return "${workspaceFolder}/" .. vim.fn.input("Enter path of test dir : ", "")
    end,
    args = { "-test.v" },
  },
}

-- Node debugger setup
dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter",
  },
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Run npm script",
      cwd = vim.fn.getcwd(),
      runtimeExecutable = "npm",
      runtimeArgs = { "run-script" },
      args = function()
        return { vim.fn.input("Enter script name: ", "dev") }
      end,
      env = {
        NODE_ENV = "development",
      },
      console = "integratedTerminal",
      skipFiles = { "<node_internals>/**" },
    },
  }
end
