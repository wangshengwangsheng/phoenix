package com.dianping.phoenix.bootstrap.tomcat6;

import org.junit.Test;

import com.dianping.phoenix.spi.internal.DevModeWebappProvider;

public class Tomcat6DevServer extends AbstractTomcat6Bootstrap {
	@Test
	public void startServer() throws Exception {
		DevModeWebappProvider kernelProvider = new DevModeWebappProvider("../phoenix-kernel", "phoenix-kernel");
		DevModeWebappProvider appProvider = new DevModeWebappProvider("../phoenix-samples/sample-app1", "sample-app1");

		startTomcat(kernelProvider, appProvider);
		display("/inspect");

		System.out.println("Press any key to stop the server ...");
		System.in.read();
	}
}
