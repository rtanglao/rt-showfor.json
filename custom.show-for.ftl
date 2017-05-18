 <!–– 
 from 
 https://support-stage.allizom.org/t5/bizapps/page/tab/community%3Astudio%3Acustom-content?component=custom.show-for
 -->
<#include "common-functions.ftl"/>

<#assign versionConfigJSON = coreNode.settings.name.get("show_for.version_config") />
<#if versionConfigJSON?has_content>
	
	<#assign versionConfig = versionConfigJSON?eval />

	<script src="${asset.get("/html/assets/jquery-3.1.0.min.js")}"></script>
	<script src="${asset.get("/html/assets/underscore-min.js")}"></script>
	<script src="${asset.get("/html/assets/browserdetect.js")}"></script>
	<script src="${asset.get("/html/assets/showfor.js")}"></script>

	<script type="application/json" class="showfor-data">
	  ${versionConfigJSON}
	</script>

	<@liaAddScript>
	  ;(function($) {
	    $(document).ready(function() {
				new ShowFor();
	    });
	  })(jQuery);
	</@liaAddScript>

	<@generateComponentContent className="lia-panel-show-for" componentTitle=text.format("label.show-for")>
		<#list versionConfig.products as product>
			<#if product.visible>
				<div class="product" data-product="${product.slug}">
					<#-- Product -->
		      <h2>
		        <input type="checkbox" checked value="product:${product.slug}">
		        ${product.title}
		      </h2>
					<#-- Versions -->
					<#attempt>
						<#assign versions = "versionConfig.versions['${product.slug}']"?eval />
					<#recover>
						<#assign versions = [] />
					</#attempt>

					<#if versions?size gt 0>
						<div class="selectbox-wrapper">
		          <select class="version">
		          	<#list versions as version>
									<#if version.visible>
										<option value="version:${version.slug}"
		                        data-min="${version.min_version}"
		                        data-max="${version.max_version}"
		                        <#if version.default?? && version.default>selected="true"</#if>>
		                  ${version.name}
		                </option>
									</#if>
		          	</#list>
		          </select>
		        </div>
					</#if>
					<#-- Platforms -->
					<#attempt>
						<#assign platforms = "versionConfig.platforms['${product.slug}']"?eval />
					<#recover>
						<#assign platforms = [] />
					</#attempt>
					<#if platforms?size gt 0>
		        <div class="selectbox-wrapper">
		          <select class="platform">
		          	<#list platforms as platform>
		          		<#if platform.visible>
		                <option value="platform:${platform.slug}" <#if platform.default?? && platform.default>selected="true"</#if>>
		                  ${platform.name}
		                </option>
		              </#if>
		            </#list>
		          </select>
		        </div>
		      </#if>
		    </div>
			</#if>
		</#list>
	</@generateComponentContent>
</#if>
