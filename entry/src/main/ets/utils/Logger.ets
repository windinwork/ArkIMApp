const TAG: string = 'ArkIMLogger'

class Logger {
  static isEnable: boolean = true

  // 基础日志方法
  private static base(level: string, ...args: (string | number | boolean | object)[]): void {
    if (!Logger.isEnable) return
    const time = new Date().toISOString()
    const message = args.map(arg => 
      typeof arg === 'object' ? JSON.stringify(arg) : arg
    ).join(' ')
    
    console.log(`[${time}] ${level}/${TAG}: ${message}`)
  }

  // 调试信息（开发阶段使用）
  static debug(...args: (string | number | boolean | object)[]): void {
    Logger.base('DEBUG', ...args)
  }

  // 普通信息
  static info(...args: (string | number | boolean | object)[]): void {
    Logger.base('INFO', ...args)
  }

  // 警告信息
  static warn(...args: (string | number | boolean | object)[]): void {
    Logger.base('WARN', ...args)
  }

  // 错误信息
  static error(...args: (string | number | boolean | object)[]): void {
    Logger.base('ERROR', ...args)
  }

  // 对象解析（方便查看对象结构）
  static json(obj: object): void {
    if (!Logger.isEnable) return
    console.log(JSON.stringify(obj, null, 2))
  }
}

export default Logger
