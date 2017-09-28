<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns1="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v2.0" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" version="2.0">
<xsl:output version="4.0" method="html" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:param name="SV_OutputFormat" select="'HTML'"/>
<xsl:variable name="XML" select="/"/>

	<!-- Copyright 2017 Luigi Di Naro - Licence: AGPL -->

	<xsl:template match="/">
		<html>
			<body>
				<h1>Progressivo Invio: <xsl:value-of select="ns1:DatiFattura/DatiFatturaHeader/ProgressivoInvio"/></h1>
				<xsl:apply-templates select="ns1:DatiFattura"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="ns1:DatiFattura/DTR">
		<h2>Cedente Prestatore</h2>
		<h3><xsl:value-of select="CessionarioCommittenteDTR/AltriDatiIdentificativi/Denominazione"/></h3>
		<b>Partita IVA: </b>
			<xsl:value-of select="CessionarioCommittenteDTR/IdentificativiFiscali/IdFiscaleIVA/IdPaese"/>
			<xsl:value-of select="CessionarioCommittenteDTR/IdentificativiFiscali/IdFiscaleIVA/IdCodice"/><br/>
		<b>Codice Fiscale: </b> <xsl:value-of select="CessionarioCommittenteDTR/IdentificativiFiscali/CodiceFiscale"/><br/>
		<b>Indirizzo: </b>
			<xsl:value-of select="CessionarioCommittenteDTR/AltriDatiIdentificativi/Sede/Indirizzo"/><br/>
		<b>Comune: </b>
			<xsl:value-of select="CessionarioCommittenteDTR/AltriDatiIdentificativi/Sede/Comune"/><br/>
		<b>Provincia: </b>
			<xsl:value-of select="CessionarioCommittenteDTR/AltriDatiIdentificativi/Sede/Provincia"/><br/>
		<b>CAP: </b>
			<xsl:value-of select="CessionarioCommittenteDTR/AltriDatiIdentificativi/Sede/CAP"/><br/>
		<b>Nazione: </b>
			<xsl:value-of select="CessionarioCommittenteDTR/AltriDatiIdentificativi/Sede/Nazione"/><br/>
		<h2>Fatture Ricevute (acquisti)</h2>
		<xsl:for-each select="CedentePrestatoreDTR">
			<h3>Fornitore: <xsl:value-of select="AltriDatiIdentificativi/Denominazione"/></h3>
			<b>Partita IVA: </b><xsl:value-of select="IdentificativiFiscali/IdFiscaleIVA/IdPaese"/>
			<xsl:value-of select="IdentificativiFiscali/IdFiscaleIVA/IdCodice"/><br/>
			<b>Codice Fiscale: </b> <xsl:value-of select="IdentificativiFiscali/CodiceFiscale"/><br/>
			<b>Indirizzo: </b>
				<xsl:value-of select="AltriDatiIdentificativi/Sede/Indirizzo"/><br/>
			<b>Comune: </b>
				<xsl:value-of select="AltriDatiIdentificativi/Sede/Comune"/><br/>
			<b>Provincia: </b>
				<xsl:value-of select="AltriDatiIdentificativi/Sede/Provincia"/><br/>
			<b>CAP: </b>
				<xsl:value-of select="AltriDatiIdentificativi/Sede/CAP"/><br/>
			<b>Nazione: </b>
				<xsl:value-of select="AltriDatiIdentificativi/Sede/Nazione"/><br/>
			<table border="1">
				<tr>
					<th>TipoDocumento</th>
					<th>Data</th>
					<th>Numero</th>
					<th>DataRegistrazione</th>
					<th>IVA</th>
				</tr>
				<xsl:for-each select="DatiFatturaBodyDTR">
					<tr>
						<td><xsl:value-of select="DatiGenerali/TipoDocumento"/></td>
						<td><xsl:value-of select="DatiGenerali/Data"/></td>
						<td><xsl:value-of select="DatiGenerali/Numero"/></td>
						<td><xsl:value-of select="DatiGenerali/DataRegistrazione"/></td>
						<td>
							<table>
								<tr>
									<th>ImponibileImporto</th>
									<th>Imposta</th>
									<th>Aliquota</th>
									<th>EsigibilitaIVA</th>
									<th>Natura</th>
								</tr>
								<xsl:for-each select="DatiRiepilogo">
									<tr>
										<td><xsl:value-of select="ImponibileImporto"/></td>
										<td><xsl:value-of select="DatiIVA/Imposta"/></td>
										<td><xsl:value-of select="DatiIVA/Aliquota"/></td>
										<td><xsl:value-of select="EsigibilitaIVA"/></td>
										<td><xsl:value-of select="Natura"/></td>
									</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="ns1:DatiFattura/DTE">
		<h2>Cedente Prestatore</h2>
		<h3><xsl:value-of select="CedentePrestatoreDTE/AltriDatiIdentificativi/Denominazione"/></h3>
		<b>Partita IVA: </b>
			<xsl:value-of select="CedentePrestatoreDTE/IdentificativiFiscali/IdFiscaleIVA/IdPaese"/>
			<xsl:value-of select="CedentePrestatoreDTE/IdentificativiFiscali/IdFiscaleIVA/IdCodice"/><br/>
		<b>Codice Fiscale: </b> <xsl:value-of select="CedentePrestatoreDTE/IdentificativiFiscali/CodiceFiscale"/><br/>
		<b>Indirizzo: </b>
			<xsl:value-of select="CedentePrestatoreDTE/AltriDatiIdentificativi/Sede/Indirizzo"/><br/>
		<b>Comune: </b>
			<xsl:value-of select="CedentePrestatoreDTE/AltriDatiIdentificativi/Sede/Comune"/><br/>
		<b>Provincia: </b>
			<xsl:value-of select="CedentePrestatoreDTE/AltriDatiIdentificativi/Sede/Provincia"/><br/>
		<b>CAP: </b>
			<xsl:value-of select="CedentePrestatoreDTE/AltriDatiIdentificativi/Sede/CAP"/><br/>
		<b>Nazione: </b>
			<xsl:value-of select="CedentePrestatoreDTE/AltriDatiIdentificativi/Sede/Nazione"/><br/>
		<h2>Fatture Emesse (vendite)</h2>
		<xsl:for-each select="CessionarioCommittenteDTE">
			<h3>Cliente: <xsl:value-of select="AltriDatiIdentificativi/Denominazione"/></h3>
			<b>Partita IVA: </b><xsl:value-of select="IdentificativiFiscali/IdFiscaleIVA/IdPaese"/>
			<xsl:value-of select="IdentificativiFiscali/IdFiscaleIVA/IdCodice"/><br/>
			<b>Codice Fiscale: </b> <xsl:value-of select="IdentificativiFiscali/CodiceFiscale"/><br/>
			<b>Indirizzo: </b>
				<xsl:value-of select="AltriDatiIdentificativi/Sede/Indirizzo"/><br/>
			<b>Comune: </b>
				<xsl:value-of select="AltriDatiIdentificativi/Sede/Comune"/><br/>
			<b>Provincia: </b>
				<xsl:value-of select="AltriDatiIdentificativi/Sede/Provincia"/><br/>
			<b>CAP: </b>
				<xsl:value-of select="AltriDatiIdentificativi/Sede/CAP"/><br/>
			<b>Nazione: </b>
				<xsl:value-of select="AltriDatiIdentificativi/Sede/Nazione"/><br/>
			<table border="1">
				<tr>
					<th>TipoDocumento</th>
					<th>Data</th>
					<th>Numero</th>
					<th>IVA</th>
				</tr>
				<xsl:for-each select="DatiFatturaBodyDTE">
					<tr>
						<td><xsl:value-of select="DatiGenerali/TipoDocumento"/></td>
						<td><xsl:value-of select="DatiGenerali/Data"/></td>
						<td><xsl:value-of select="DatiGenerali/Numero"/></td>
						<td>
							<table>
								<tr>
									<th>ImponibileImporto</th>
									<th>Imposta</th>
									<th>Aliquota</th>
									<th>EsigibilitaIVA</th>
									<th>Natura</th>
								</tr>
								<xsl:for-each select="DatiRiepilogo">
									<tr>
										<td><xsl:value-of select="ImponibileImporto"/></td>
										<td><xsl:value-of select="DatiIVA/Imposta"/></td>
										<td><xsl:value-of select="DatiIVA/Aliquota"/></td>
										<td><xsl:value-of select="EsigibilitaIVA"/></td>
										<td><xsl:value-of select="Natura"/></td>
									</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
