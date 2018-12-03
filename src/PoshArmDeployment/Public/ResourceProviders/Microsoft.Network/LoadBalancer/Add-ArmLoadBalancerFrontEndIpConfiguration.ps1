function Add-ArmLoadBalancerFrontEndIpConfiguration {
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("LoadBalancer")]
    Param(
        [PSTypeName("LoadBalancer")]
        [Parameter(Mandatory, ValueFromPipeline)]
        $LoadBalancer,
        [PSTypeName("LoadBalancerFrontEndIpConfiguration")]
        [Parameter(Mandatory)]
        $FrontEndIpconfiguration
    )

    If ($PSCmdlet.ShouldProcess("Adding front end ip configuration")) {
        $LoadBalancerResourceId = $LoadBalancer._ResourceId
        $FrontEndIpConfigurationName = $FrontEndIpconfiguration.Name
        $FrontEndIpconfiguration._ResourceId = "[concat($LoadBalancerResourceId, '/frontendIPConfigurations/', '$FrontEndIpConfigurationName')]"

        $LoadBalancer.properties.frontEndIpconfigurations += $FrontEndIpconfiguration

        return $LoadBalancer
    }
}