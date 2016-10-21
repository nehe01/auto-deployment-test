using System.ServiceProcess;
using System.Timers;

namespace SampleService
{
  public partial class Scheduler : ServiceBase
  {
    private Timer timer = null;

    public Scheduler()
    {
      InitializeComponent();
    }

    protected override void OnStart(string[] args)
    {
      timer = new Timer();
      this.timer.Interval = 30000;
      this.timer.Elapsed += new System.Timers.ElapsedEventHandler(this.timer_Tick);
      timer.Enabled = true;
      Library.WriteLog("Windows Service Started in pune");
    }

    private void timer_Tick(object sender, ElapsedEventArgs e)
    {
      Library.WriteLog("Timer Ticked");
    }

    protected override void OnStop()
    {
      timer.Enabled = false;
      Library.WriteLog("Stopped");
    }
  }
}
