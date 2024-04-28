import { FC } from "react";
import { Home, Search } from "lucide-react";
import { useRecoilValue } from "recoil";
import { roleState } from "@/state/role";
import { URLS } from "@/constants/urls";
import SideNavLink from "./SideNavLink";
import UserItem from "./UserItem";

const ALL_LINKS = [
  {
    path: URLS.DASHBOARD,
    icon: <Home size={40} strokeWidth={1} />,
  },
  {
    path: URLS.GAMES,
    icon: <Search size={40} strokeWidth={1} />,
  },
];


const SideNav: FC = () => {
  const role = useRecoilValue(roleState);

  return (
    <div
      className="flex h-full w-[68px] flex-col justify-between rounded-lg bg-section px-3 py-4 text-section-foreground"
      data-test="cokolwiek"
    >
      <div className="flex flex-col items-center gap-3">
        <img src="/logo.png" className="h-12 w-12 rounded-lg" alt="GameShare logo" />
        {ALL_LINKS.map(({ icon, path }) => (
          <SideNavLink icon={icon} path={path} key={path} />
        ))}
      </div>

      <div className="flex flex-col items-center gap-3">
        <UserItem />
      </div>
    </div>
  );
};

export default SideNav;
