package mg.grailsapp.model

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.codehaus.groovy.util.HashCodeHelper
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@ToString(cache=true, includeNames=true, includePackage=false)
class SecUserRole implements Serializable {

	private static final long serialVersionUID = 1

	SecUser secUser
	SecRole secRole

	@Override
	boolean equals(other) {
		if (other instanceof SecUserRole) {
			other.secUserId == secUser?.id && other.secRoleId == secRole?.id
		}
	}

    @Override
	int hashCode() {
	    int hashCode = HashCodeHelper.initHash()
        if (secUser) {
            hashCode = HashCodeHelper.updateHash(hashCode, secUser.id)
		}
		if (secRole) {
		    hashCode = HashCodeHelper.updateHash(hashCode, secRole.id)
		}
		hashCode
	}

	static SecUserRole get(long secUserId, long secRoleId) {
		criteriaFor(secUserId, secRoleId).get()
	}

	static boolean exists(long secUserId, long secRoleId) {
		criteriaFor(secUserId, secRoleId).count()
	}

	private static DetachedCriteria criteriaFor(long secUserId, long secRoleId) {
		SecUserRole.where {
			secUser == SecUser.load(secUserId) &&
			secRole == SecRole.load(secRoleId)
		}
	}

	static SecUserRole create(SecUser secUser, SecRole secRole, boolean flush = false) {
		def instance = new SecUserRole(secUser: secUser, secRole: secRole)
		instance.save(flush: flush)
		instance
	}

	static boolean remove(SecUser u, SecRole r) {
		if (u != null && r != null) {
			SecUserRole.where { secUser == u && secRole == r }.deleteAll()
		}
	}

	static int removeAll(SecUser u) {
		u == null ? 0 : SecUserRole.where { secUser == u }.deleteAll() as int
	}

	static int removeAll(SecRole r) {
		r == null ? 0 : SecUserRole.where { secRole == r }.deleteAll() as int
	}

	static constraints = {
	    secUser nullable: false
		secRole nullable: false, validator: { SecRole r, SecUserRole ur ->
			if (ur.secUser?.id) {
				if (SecUserRole.exists(ur.secUser.id, r.id)) {
				    return ['userRole.exists']
				}
			}
		}
	}

	static mapping = {
		id composite: ['secUser', 'secRole']
		version false
	}
}
