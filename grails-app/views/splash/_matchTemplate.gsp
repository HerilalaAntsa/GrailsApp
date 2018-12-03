
    <tr>
        <td><g:formatDate date="${match?.dateMatch}" type="datetime" style="MEDIUM"/></td>
        <td><span class="${sec.username() == match?.joueur?.username? 'text-danger':''}">${match?.joueur?.username}</span></td>
        <td><span class="${sec.username() == match?.adversaire?.username? 'text-danger':''}">${match?.adversaire?.username}</span></td>
        <td><g:formatNumber number="${match?.scoreJ}" type="number"
                            maxFractionDigits="2" roundingMode="HALF_DOWN" /></td>
        <td><g:formatNumber number="${match?.scoreA}" type="number"
                            maxFractionDigits="2" roundingMode="HALF_DOWN" /></td>
    </tr>